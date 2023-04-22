package com.good.neighbor.util;

public class PageTest {

  private int pageSize = 10;
	private int pageBlock = 10;
	private int curPage=1;
	private int startRow;
	private int endRow;
	private int cnt;
	private int pageCnt;
	private int startPage;
	private int endPage;
	private int prevBlock;
	private int nextBlock;
	private String keyWord;
	private int nowPage;
	private int skip;
  private int amount;

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyWord;
	}

	public void setKeyword(String keyWord) {
		this.keyWord = keyWord;
	}

	public PageTest() {}

	public PageTest(int cnt, int curPage) {
		this.cnt=cnt;
		this.curPage=curPage;

		this.pageCnt=cnt/pageSize+(cnt%pageSize==0?0:1);

		this.startRow=(curPage - 1)*pageSize + 1;
		this.endRow=curPage*pageSize;

		this.startPage = (curPage/pageBlock)*10 + 1;
		this.endPage = startPage+pageBlock - 1;
	}

  public int getPageSize() {
    return pageSize;
  }
  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

	public int getPageBlock() {
		return pageBlock;
	}

  public int getCurPage() {
    return curPage;
  }
  public void setCurPage(int curPage) {
    this.curPage = curPage;
  }

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

	public int getPageCnt() {
		return pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevBlock() {
		this.prevBlock = startPage - 10;
		return prevBlock;
	}

	public int getNextBlock() {
		this.nextBlock = startPage + 10;
		return nextBlock;
	}

}
