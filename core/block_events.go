package core

import (
	"fmt"

	"github.com/DefiantLabs/cosmos-tax-cli/config"
	eventTypes "github.com/DefiantLabs/cosmos-tax-cli/cosmos/events"
	"github.com/DefiantLabs/cosmos-tax-cli/cosmoshub"
	ctypes "github.com/tendermint/tendermint/rpc/core/types"
)

var (
	beginBlockerEventTypeHandlers = map[string][]func() eventTypes.CosmosEvent{}
	endBlockerEventTypeHandlers   = map[string][]func() eventTypes.CosmosEvent{}
)

func ChainSpecificEndBlockerEventTypeHandlerBootstrap(chainID string) {
	var chainSpecificEndBlockerEventTypeHandler map[string][]func() eventTypes.CosmosEvent
	if chainID == cosmoshub.ChainID {
		chainSpecificEndBlockerEventTypeHandler = cosmoshub.EndBlockerEventTypeHandlers
	}
	for key, value := range chainSpecificEndBlockerEventTypeHandler {
		if list, ok := endBlockerEventTypeHandlers[key]; ok {
			endBlockerEventTypeHandlers[key] = append(value, list...)
		} else {
			endBlockerEventTypeHandlers[key] = value
		}
	}
}

func ChainSpecificBeginBlockerEventTypeHandlerBootstrap(chainID string) {
	// Stub, for use when we have begin blocker events
}

func ProcessRPCBlockEvents(blockResults *ctypes.ResultBlockResults) ([]eventTypes.EventRelevantInformation, error) {
	var taxableEvents []eventTypes.EventRelevantInformation
	if len(endBlockerEventTypeHandlers) != 0 {
		for _, event := range blockResults.EndBlockEvents {
			handlers, handlersFound := endBlockerEventTypeHandlers[event.Type]

			if !handlersFound {
				continue
			}

			var err error
			for _, handler := range handlers {
				cosmosEventHandler := handler()
				err = cosmosEventHandler.HandleEvent(event.Type, event)
				if err != nil {
					config.Log.Debug(fmt.Sprintf("[Block: %v] Cosmos Block EndBlocker event of known type: %s. Handler failed", blockResults.Height, event.Type), err)
					continue
				}
				relevantData := cosmosEventHandler.ParseRelevantData()

				taxableEvents = append(taxableEvents, relevantData...)

				config.Log.Debug(fmt.Sprintf("[Block: %v] Cosmos Block EndBlocker event of known type: %s: %s", blockResults.Height, event.Type, cosmosEventHandler))
				break
			}

			// If err is not nil here, all handlers failed
			if err != nil {
				return nil, fmt.Errorf("could not handle event type %s, all handlers failed", event.Type)
			}
		}
	}

	if len(beginBlockerEventTypeHandlers) != 0 {
		for _, event := range blockResults.BeginBlockEvents {
			handlers, handlersFound := beginBlockerEventTypeHandlers[event.Type]

			if !handlersFound {
				continue
			}

			var err error
			for _, handler := range handlers {
				cosmosEventHandler := handler()
				err = cosmosEventHandler.HandleEvent(event.Type, event)
				if err != nil {
					config.Log.Debug(fmt.Sprintf("[Block: %v] Cosmos Block EndBlocker event of known type: %s. Handler failed", blockResults.Height, event.Type), err)
					continue
				}
				relevantData := cosmosEventHandler.ParseRelevantData()

				taxableEvents = append(taxableEvents, relevantData...)

				config.Log.Debug(fmt.Sprintf("[Block: %v] Cosmos Block BeginBlocker event of known type: %s: %s", blockResults.Height, event.Type, cosmosEventHandler))
				break
			}

			// If err is not nil here, all handlers failed
			if err != nil {
				return nil, fmt.Errorf("could not handle event type %s, all handlers failed", event.Type)
			}
		}
	}

	return taxableEvents, nil
}
