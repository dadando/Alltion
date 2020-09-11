package com.spring.alltion.creditScore;

public interface CreditScoreService {
	public SaleCreditScoreVO getSaleCreditScore(String sale_id);
	public SaleCreditScoreVO getSaleScoreInfo(SaleCreditScoreVO salevo);
	public int saleNormalCount(SaleCreditScoreVO salevo);
	public int saleDenialCount(SaleCreditScoreVO salevo);
	public int saleReturnCount(SaleCreditScoreVO salevo);
	public int saleUndeliveredCount(SaleCreditScoreVO salevo);
	public int saleRateScoreCount(SaleCreditScoreVO salevo);
	
	public PurchaseCreditScoreVO getPurchaseCreditScore(String purchase_id);
	public PurchaseCreditScoreVO getPurchaseScoreInfo(PurchaseCreditScoreVO purchasevo);
	public int purchaseNormalCount(PurchaseCreditScoreVO purchasevo);
	public int purchaseDenialCount(PurchaseCreditScoreVO purchasevo);
	public int purchaseReturnCount(PurchaseCreditScoreVO purchasevo);
	public int purchaseUndeliveredCount(PurchaseCreditScoreVO purchasevo);
	public int purchaseRateScoreCount(PurchaseCreditScoreVO purchasevo);
}
