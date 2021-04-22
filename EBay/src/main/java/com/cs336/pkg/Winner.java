package com.cs336.pkg;

public class Winner{
	String userName;
	int AID;
	float reservePrice;
	float highestPrice;
	
	public Winner(String uN, int id, float rP, float hP) {
		userName = uN;
		AID = id;
		reservePrice = rP;
		highestPrice = hP;
	}
	public String getUserName() {
		return userName;
	}
	public int getAID() {
		return AID;
	}
	public boolean getWinner() {
		return reservePrice<highestPrice;
	}
}