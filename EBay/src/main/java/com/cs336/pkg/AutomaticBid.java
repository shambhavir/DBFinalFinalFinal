package com.cs336.pkg;

public class AutomaticBid{
	int AID;
	float bidIncrement;
	float upperLimit;
	String userName;
	
	public AutomaticBid(int aID, float bI, float uL, String uN) {
		AID = aID;
		bidIncrement = bI;
		upperLimit = uL;
		userName = uN;
	}
	public int getAID() {
		return AID;
	}
	public float getbidIncrement() {
		return bidIncrement;
	}
	public float getupperLimit() {
		return upperLimit;
	}
	public String getUsername() {
		return userName;
	}
}