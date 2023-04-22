package com.good.neighbor.model;

public class PaginationDTO {

  // fields --------------------------------------------------------------------------------------->
  private int totalPage;
	private int currentPage;
	private int maxPerPage;
	private int startPage = 1;
	private int endPage = 10;
	private boolean preButtonPage = false;
	private boolean nextButtonPage;
	private int currentBlockPage;
	private int totalBlockPage;

	// getters -------------------------------------------------------------------------------------->
  public int getTotalPage() {
    return totalPage;
  }
  public int getCurrentPage() {
    return currentPage;
  }
  public int getMaxPerPage() {
    return maxPerPage;
  }
  public int getStartPage() {
    return startPage;
  }
  public int getEndPage() {
    return endPage;
  }
  public boolean isPreButtonPage() {
    return preButtonPage;
  }
  public boolean isNextButtonPage() {
    return nextButtonPage;
  }
  public int getCurrentBlockPage() {
    return currentBlockPage;
  }
  public int getTotalBlockPage() {
    return totalBlockPage;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }
  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }
  public void setMaxPerPage(int maxPerPage) {
    this.maxPerPage = maxPerPage;
  }
  public void setStartPage(int startPage) {
    this.startPage = startPage;
  }
  public void setEndPage(int endPage) {
    this.endPage = endPage;
  }
  public void setPreButtonPage(boolean preButtonPage) {
    this.preButtonPage = preButtonPage;
  }
  public void setNextButtonPage(boolean nextButtonPage) {
    this.nextButtonPage = nextButtonPage;
  }
  public void setCurrentBlockPage(int currentBlockPage) {
    this.currentBlockPage = currentBlockPage;
  }
  public void setTotalBlockPage(int totalBlockPage) {
    this.totalBlockPage = totalBlockPage;
  }

  // constructors --------------------------------------------------------------------------------->
	public PaginationDTO(int totalPage, int currentPage, int maxPerPage, int currentBlockPage) {
		super();
		this.totalPage = totalPage;
		this.currentPage = currentPage;
		this.maxPerPage = maxPerPage;
		this.currentBlockPage = currentBlockPage;
	}
	// 현재 페이지 블록 계산
	public void currentBlockPage() {
		this.currentBlockPage = (int) Math.ceil((double) this.currentPage / 5);
	}
	// 페이지 블록 시작 페이지 계산
	public void startPage() {
		this.startPage = (this.currentBlockPage - 1) * 5 + 1;
	}
	// 페이지 블록 끝 페이지 계산
	public void endPage() {
		this.endPage = this.startPage + 4;
		if (this.currentBlockPage >= this.totalPage / 5) {
			this.endPage = this.totalPage;
		}
	}
	// 이전 페이지로 가는 화살표 계산
	public void preButtonPage() {
		if (this.currentBlockPage == 1) {
			this.preButtonPage = false;
		}
    else {
			this.preButtonPage = true;
		}
	}
	// 다음 페이지로 가는 화살표 계산
	public void nextButtonPage() {
		if (this.currentBlockPage == this.totalPage / 5) {
			this.nextButtonPage = false;
		}
    else {
			this.nextButtonPage = true;
		}
	}

  // toString() ----------------------------------------------------------------------------------->
	@Override
	public String toString() {
		return "PaginationDTO ["
      + "totalPage = " + totalPage + ", "
      + "currentPage = " + currentPage + ", "
      + "maxPerPage = " + maxPerPage + ", "
      + "startPage = " + startPage + ", "
      + "endPage = " + endPage + ", "
      + "preButtonPage = " + preButtonPage + ", "
      + "nextButtonPage = " + nextButtonPage + ", "
      + "currentBlockPage = " + currentBlockPage +
    "]";
	}

}