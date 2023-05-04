package com.good.neighbor.model;

public class PaginationDTO {

  // fields --------------------------------------------------------------------------------------->
  private Integer totalPage;
	private Integer currentPage;
	private Integer maxPerPage;
	private Integer startPage = 1;
	private Integer endPage = 10;
	private boolean preButtonPage = false;
	private boolean nextButtonPage;
	private Integer currentBlockPage;
	private Integer totalBlockPage;

	// getters -------------------------------------------------------------------------------------->
  public Integer getTotalPage() {
    return totalPage;
  }
  public Integer getCurrentPage() {
    return currentPage;
  }
  public Integer getMaxPerPage() {
    return maxPerPage;
  }
  public Integer getStartPage() {
    return startPage;
  }
  public Integer getEndPage() {
    return endPage;
  }
  public boolean isPreButtonPage() {
    return preButtonPage;
  }
  public boolean isNextButtonPage() {
    return nextButtonPage;
  }
  public Integer getCurrentBlockPage() {
    return currentBlockPage;
  }
  public Integer getTotalBlockPage() {
    return totalBlockPage;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setTotalPage(Integer totalPage) {
    this.totalPage = totalPage;
  }
  public void setCurrentPage(Integer currentPage) {
    this.currentPage = currentPage;
  }
  public void setMaxPerPage(Integer maxPerPage) {
    this.maxPerPage = maxPerPage;
  }
  public void setStartPage(Integer startPage) {
    this.startPage = startPage;
  }
  public void setEndPage(Integer endPage) {
    this.endPage = endPage;
  }
  public void setPreButtonPage(boolean preButtonPage) {
    this.preButtonPage = preButtonPage;
  }
  public void setNextButtonPage(boolean nextButtonPage) {
    this.nextButtonPage = nextButtonPage;
  }
  public void setCurrentBlockPage(Integer currentBlockPage) {
    this.currentBlockPage = currentBlockPage;
  }
  public void setTotalBlockPage(Integer totalBlockPage) {
    this.totalBlockPage = totalBlockPage;
  }

  // constructors --------------------------------------------------------------------------------->
	public PaginationDTO(Integer totalPage, Integer currentPage, Integer maxPerPage, Integer currentBlockPage) {
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