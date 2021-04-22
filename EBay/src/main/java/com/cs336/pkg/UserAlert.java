package com.cs336.pkg;

public class UserAlert{
	String itemName;
	String itemType;
	
	public UserAlert(String iN, String iT) {
		itemName = iN;
		itemType = iT;
	}
	public String getitemName() {
		return itemName;
	}
	public String getitemType() {
		return itemType;
	}
}