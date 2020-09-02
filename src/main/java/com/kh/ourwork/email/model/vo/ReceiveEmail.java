package com.kh.ourwork.email.model.vo;

import java.util.Date;

public class ReceiveEmail {
	private int mId;
	private String eeId;
	private String mTitle;
	private String mContent;
	private String mReceipt;
	private Date sendDate;
	private String mStatus;
	private String sendStatus;
	private int mLevel;
	private String reId;
	private int erLevel;
	private Date receiveDate;
	private String eName;
	private String dName;
	
	public ReceiveEmail() {}

	public ReceiveEmail(int mId, String eeId, String mTitle, String mContent, String mReceipt, Date sendDate,
			String mStatus, String sendStatus, int mLevel, String reId, int erLevel, Date receiveDate, String eName,
			String dName) {
		super();
		this.mId = mId;
		this.eeId = eeId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mReceipt = mReceipt;
		this.sendDate = sendDate;
		this.mStatus = mStatus;
		this.sendStatus = sendStatus;
		this.mLevel = mLevel;
		this.reId = reId;
		this.erLevel = erLevel;
		this.receiveDate = receiveDate;
		this.eName = eName;
		this.dName = dName;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getEeId() {
		return eeId;
	}

	public void setEeId(String eeId) {
		this.eeId = eeId;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public String getmReceipt() {
		return mReceipt;
	}

	public void setmReceipt(String mReceipt) {
		this.mReceipt = mReceipt;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}

	public int getmLevel() {
		return mLevel;
	}

	public void setmLevel(int mLevel) {
		this.mLevel = mLevel;
	}

	public String getReId() {
		return reId;
	}

	public void setReId(String reId) {
		this.reId = reId;
	}

	public int getErLevel() {
		return erLevel;
	}

	public void setErLevel(int erLevel) {
		this.erLevel = erLevel;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	@Override
	public String toString() {
		return "ReceiveEmail [mId=" + mId + ", eeId=" + eeId + ", mTitle=" + mTitle + ", mContent=" + mContent
				+ ", mReceipt=" + mReceipt + ", sendDate=" + sendDate + ", mStatus=" + mStatus + ", sendStatus="
				+ sendStatus + ", mLevel=" + mLevel + ", reId=" + reId + ", erLevel=" + erLevel + ", receiveDate="
				+ receiveDate + ", eName=" + eName + ", dName=" + dName + "]";
	}

	
}
