package com.spring.alltion.mypage;

public class Pagination {
	private int page; // 현재 페이지 번호
	private int listcount; // 게시글 갯수
	
	private int startrow; // 화면에 표시될 첫번째 게시글
	private int endrow; // 화면에 표시될 마지막 게시글
	
	private int startpage; // 화면에 표시될 첫번째 페이지링크
	private int endpage; // 화면에 표시될 마지막 페이지링크
	private int maxpage; // 게시글 갯수에 따른 최대 페이지링크
	
	private int prev; // 이전 페이지 번호
	private int next; // 다음 페이지 번호

	private int rowlimit; // 한 화면에 보이는 글의 갯수
	private int pagelimit; // 한 화면에 보이는 페이지의 갯수
	
	// 객체를 생성할때 현재페이지와 게시물갯수를 받는다
	public Pagination (int page, int listcount, int rowlimit, int pagelimit) {
		this.page = page;
		this.listcount = listcount;
		this.rowlimit = rowlimit;
		this.pagelimit = pagelimit;
	}
	
	// 페이징처리 작업 예시는 rowlimit = 5, pagelimit 5 기준
	public void setPageInfo() {
		// 읽기 시작할 row 번호
		startrow = (page - 1) * rowlimit + 1;

		// 읽을 마지막 row 번호
		endrow = startrow + rowlimit - 1;
		
		// 페이지를 총페이지수를 구함(글이 1개이면 1페이지, 6개면 2페이지, 26개면 6페이지)
		maxpage = (int) Math.ceil((double) listcount / rowlimit);
		
		// 하단 페이지링크 갯수[이전] [1] ... [10] [다음]의 [1]에 해당
		startpage = (int) Math.floor(((double) page / pagelimit)) * pagelimit + 1;

		// 글이 1개이면 startpage는 1이 되고 maxpage는 1이 된다
		// 글이 6개이면 startpage는 1이 되고 maxpage는 2이 된다
		// 글이 26개이면 startpage는 1이 되고 maxpage는 6이 된다
		// 글이 26인 상태에서는 하단에 page링크는 1~5까지만 떠야되며 6은 뜨지 말아야 된다
		// 그걸 위해 startpage가 1일때는 endpage는 5까지만 
		// 		startpage 6일때는 endpage 10까지만 뜨게 한다
		// 또한, maxapge를 넘지 말아야 하므로 endpage의 초기값은 maxapge로 설정한다
		endpage = maxpage;
		if (endpage > startpage + pagelimit - 1) {
			endpage = startpage + pagelimit - 1;
		}
		
		// startpage가 1~5이면 '<'이전페이지로 가는 태그가 필요없다
		// startpage기 6이상이라면 '<'그전 페이지로 이동하는 태그를 생성해야된다 
		if (startpage <= pagelimit) {
			prev = 0;
		} else {
			prev = startpage - 1;
		}
		
		// endpage가 maxpage와 같다면 '>'이전페이지로 가는 태그가 필요없다
		// endpage기 maxpage이하라면 '>'이후 페이지로 이동하는 태그를 생성해야된다 
		if (endpage == maxpage) {
			next = 0;
		} else {
			next = endpage + 1;
		}
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getListcount() {
		return listcount;
	}

	public void setListcount(int listcount) {
		this.listcount = listcount;
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public int getMaxpage() {
		return maxpage;
	}

	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getRowlimit() {
		return rowlimit;
	}

	public void setRowlimit(int rowlimit) {
		this.rowlimit = rowlimit;
	}

	public int getPagelimit() {
		return pagelimit;
	}

	public void setPagelimit(int pagelimit) {
		this.pagelimit = pagelimit;
	}
}
