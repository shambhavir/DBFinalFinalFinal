package com.cs336.pkg;

public class Alert{
	String userName;
	int AID;
	
	public Alert(String uN, int id) {
		userName = uN;
		AID = id;
	}
	public String getUserName() {
		return userName;
	}
	public int getAID() {
		return AID;
	}
}