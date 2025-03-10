package koinly

import (
	"fmt"

	"github.com/DefiantLabs/cosmos-tax-cli/db"
	"github.com/DefiantLabs/cosmos-tax-cli/util"
)

func (row Row) GetRowForCsv() []string {
	return []string{
		row.Date,
		row.SentAmount,
		row.SentCurrency,
		row.ReceivedAmount,
		row.ReceivedCurrency,
		row.FeeAmount,
		row.FeeCurrency,
		row.NetWorthAmount,
		row.NetWorthCurrency,
		row.Label.String(),
		row.Description,
		row.TxHash,
	}
}

func (row Row) GetDate() string {
	return row.Date
}

// EventParseBasic handles the deposit os osmos rewards
func (row *Row) EventParseBasic(event db.TaxableEvent) error {
	row.Date = event.Block.TimeStamp.Format(TimeLayout)

	conversionAmount, conversionSymbol, err := db.ConvertUnits(util.FromNumeric(event.Amount), event.Denomination)
	if err == nil {
		row.ReceivedAmount = conversionAmount.Text('f', -1)
		row.ReceivedCurrency = conversionSymbol
	} else {
		row.ReceivedAmount = util.NumericToString(event.Amount)
		row.ReceivedCurrency = event.Denomination.Base
	}
	row.Label = Reward
	return nil
}

// ParseBasic: Handles the fields that are shared between most types.
func (row *Row) ParseBasic(address string, event db.TaxableTransaction) error {
	row.Date = event.Message.Tx.Block.TimeStamp.Format(TimeLayout)
	row.TxHash = event.Message.Tx.Hash

	// deposit
	if event.ReceiverAddress.Address == address {
		conversionAmount, conversionSymbol, err := db.ConvertUnits(util.FromNumeric(event.AmountReceived), event.DenominationReceived)
		if err != nil {
			return fmt.Errorf("cannot parse denom units for TX %s (classification: deposit)", row.TxHash)
		}
		row.ReceivedAmount = conversionAmount.Text('f', -1)
		row.ReceivedCurrency = conversionSymbol
		row.Label = Income
	} else if event.SenderAddress.Address == address { // withdrawal
		conversionAmount, conversionSymbol, err := db.ConvertUnits(util.FromNumeric(event.AmountSent), event.DenominationSent)
		if err != nil {
			return fmt.Errorf("cannot parse denom units for TX %s (classification: withdrawal)", row.TxHash)
		}
		row.SentAmount = conversionAmount.Text('f', -1)
		row.SentCurrency = conversionSymbol
		row.Label = Cost
	}

	return nil
}

func (row *Row) ParseSwap(event db.TaxableTransaction) error {
	row.Date = event.Message.Tx.Block.TimeStamp.Format(TimeLayout)
	row.TxHash = event.Message.Tx.Hash
	row.Label = Swap

	recievedConversionAmount, recievedConversionSymbol, err := db.ConvertUnits(util.FromNumeric(event.AmountReceived), event.DenominationReceived)
	if err != nil {
		return fmt.Errorf("cannot parse denom units for TX %s (classification: swap received)", row.TxHash)
	}

	row.ReceivedAmount = recievedConversionAmount.Text('f', -1)
	row.ReceivedCurrency = recievedConversionSymbol

	sentConversionAmount, sentConversionSymbol, err := db.ConvertUnits(util.FromNumeric(event.AmountSent), event.DenominationSent)
	if err != nil {
		return fmt.Errorf("cannot parse denom units for TX %s (classification: swap sent)", row.TxHash)
	}

	row.SentAmount = sentConversionAmount.Text('f', -1)
	row.SentCurrency = sentConversionSymbol

	return nil
}

func (row *Row) ParseFee(tx db.Tx, fee db.Fee) error {
	row.Date = tx.Block.TimeStamp.Format(TimeLayout)
	row.TxHash = tx.Hash
	row.Label = Cost

	sentConversionAmount, sentConversionSymbol, err := db.ConvertUnits(util.FromNumeric(fee.Amount), fee.Denomination)
	if err != nil {
		return fmt.Errorf("cannot parse denom units for TX %s (classification: swap sent)", row.TxHash)
	}

	row.SentAmount = sentConversionAmount.Text('f', -1)
	row.SentCurrency = sentConversionSymbol

	return nil
}
