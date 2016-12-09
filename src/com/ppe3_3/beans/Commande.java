package com.ppe3_3.beans;
import java.util.Date;

public class Commande {
	private int idc;
	private Date datec;
	private String commentaireClientC;
	private Date dateLivreC;
	private String modeReglementC;
	/**
	 * @return the idc
	 */
	public int getIdc() {
		return idc;
	}
	/**
	 * @param idc the idc to set
	 */
	public void setIdc(int idc) {
		this.idc = idc;
	}
	/**
	 * @return the datec
	 */
	public Date getDatec() {
		return datec;
	}
	/**
	 * @param datec the datec to set
	 */
	public void setDatec(Date datec) {
		this.datec = datec;
	}
	/**
	 * @return the commentaireClientC
	 */
	public String getCommentaireClientC() {
		return commentaireClientC;
	}
	/**
	 * @param commentaireClientC the commentaireClientC to set
	 */
	public void setCommentaireClientC(String commentaireClientC) {
		this.commentaireClientC = commentaireClientC;
	}
	/**
	 * @return the dateLivreC
	 */
	public Date getDateLivreC() {
		return dateLivreC;
	}
	/**
	 * @param dateLivreC the dateLivreC to set
	 */
	public void setDateLivreC(Date dateLivreC) {
		this.dateLivreC = dateLivreC;
	}
	/**
	 * @return the modeReglementC
	 */
	public String getModeReglementC() {
		return modeReglementC;
	}
	/**
	 * @param modeReglementC the modeReglementC to set
	 */
	public void setModeReglementC(String modeReglementC) {
		this.modeReglementC = modeReglementC;
	}
}
