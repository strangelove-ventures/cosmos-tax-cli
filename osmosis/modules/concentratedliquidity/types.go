package concentratedliquidity

import (
	"errors"
	"fmt"
	"strings"

	parsingTypes "github.com/DefiantLabs/cosmos-indexer/cosmos/modules"
	txModule "github.com/DefiantLabs/cosmos-indexer/cosmos/modules/tx"
	"github.com/DefiantLabs/cosmos-indexer/util"
	sdk "github.com/cosmos/cosmos-sdk/types"
	clTypes "github.com/osmosis-labs/osmosis/v16/x/concentrated-liquidity/types"
)

const (
	MsgCreatePosition   = "/osmosis.concentratedliquidity.v1beta1.MsgCreatePosition"
	MsgWithdrawPosition = "/osmosis.concentratedliquidity.v1beta1.MsgWithdrawPosition"
)

type WrapperMsgCreatePosition struct {
	txModule.Message
	OsmosisMsgCreatePosition *clTypes.MsgCreatePosition
	TokensSent               sdk.Coins
	Address                  string
}

func (sf *WrapperMsgCreatePosition) String() string {
	var tokensSent []string
	if !(len(sf.TokensSent) == 0) {
		for _, v := range sf.TokensSent {
			tokensSent = append(tokensSent, v.String())
		}
	}
	return fmt.Sprintf("MsgCreatePosition: %s created position by sending %s",
		sf.Address, strings.Join(tokensSent, ", "))
}

func (sf *WrapperMsgCreatePosition) HandleMsg(msgType string, msg sdk.Msg, log *txModule.LogMessage) error {
	sf.Type = msgType
	sf.OsmosisMsgCreatePosition = msg.(*clTypes.MsgCreatePosition)

	validLog := txModule.IsMessageActionEquals(sf.GetType(), log)
	if !validLog {
		return util.ReturnInvalidLog(msgType, log)
	}

	coinSpentEvents := txModule.GetEventsWithType("coin_spent", log)
	if len(coinSpentEvents) == 0 {
		return &txModule.MessageLogFormatError{MessageType: msgType, Log: fmt.Sprintf("%+v", log)}
	}

	senderCoinsSpentStrings := txModule.GetCoinsSpent(sf.OsmosisMsgCreatePosition.Sender, coinSpentEvents)

	for _, coinReceivedString := range senderCoinsSpentStrings {
		coinsReceived, err := sdk.ParseCoinsNormalized(coinReceivedString)
		if err != nil {
			return errors.New("error parsing coins received from event")
		}

		sf.TokensSent = append(sf.TokensSent, coinsReceived...)
	}

	sf.Address = sf.OsmosisMsgCreatePosition.Sender

	return nil
}

func (sf *WrapperMsgCreatePosition) ParseRelevantData() []parsingTypes.MessageRelevantInformation {
	relevantData := make([]parsingTypes.MessageRelevantInformation, 0)

	for _, token := range sf.TokensSent {
		if token.Amount.IsPositive() {
			relevantData = append(relevantData, parsingTypes.MessageRelevantInformation{
				AmountSent:       token.Amount.BigInt(),
				DenominationSent: token.Denom,
				SenderAddress:    sf.Address,
			})
		}
	}
	return relevantData
}

type WrapperMsgWithdrawPosition struct {
	txModule.Message
	OsmosisMsgWithdrawPosition *clTypes.MsgWithdrawPosition
	TokensRecieved             sdk.Coins
	Address                    string
}

func (sf *WrapperMsgWithdrawPosition) String() string {
	var tokensRecv []string
	if !(len(sf.TokensRecieved) == 0) {
		for _, v := range sf.TokensRecieved {
			tokensRecv = append(tokensRecv, v.String())
		}
	}
	return fmt.Sprintf("MsgWithdrawPosition: %s withdrew position by receiving %s",
		sf.Address, strings.Join(tokensRecv, ", "))
}

func (sf *WrapperMsgWithdrawPosition) HandleMsg(msgType string, msg sdk.Msg, log *txModule.LogMessage) error {
	sf.Type = msgType
	sf.OsmosisMsgWithdrawPosition = msg.(*clTypes.MsgWithdrawPosition)

	validLog := txModule.IsMessageActionEquals(sf.GetType(), log)
	if !validLog {
		return util.ReturnInvalidLog(msgType, log)
	}

	coinReceivedEvents := txModule.GetEventsWithType("coin_received", log)
	if len(coinReceivedEvents) == 0 {
		return &txModule.MessageLogFormatError{MessageType: msgType, Log: fmt.Sprintf("%+v", log)}
	}

	senderCoinsReceivedStrings := txModule.GetCoinsReceived(sf.OsmosisMsgWithdrawPosition.Sender, coinReceivedEvents)

	for _, coinReceivedString := range senderCoinsReceivedStrings {
		coinsReceived, err := sdk.ParseCoinsNormalized(coinReceivedString)
		if err != nil {
			return errors.New("error parsing coins received from event")
		}

		sf.TokensRecieved = append(sf.TokensRecieved, coinsReceived...)
	}

	sf.Address = sf.OsmosisMsgWithdrawPosition.Sender

	return nil
}

func (sf *WrapperMsgWithdrawPosition) ParseRelevantData() []parsingTypes.MessageRelevantInformation {
	relevantData := make([]parsingTypes.MessageRelevantInformation, 0)
	for _, token := range sf.TokensRecieved {
		if token.Amount.IsPositive() {
			relevantData = append(relevantData, parsingTypes.MessageRelevantInformation{
				AmountReceived:       token.Amount.BigInt(),
				DenominationReceived: token.Denom,
				SenderAddress:        sf.Address,
			})
		}
	}
	return relevantData
}
