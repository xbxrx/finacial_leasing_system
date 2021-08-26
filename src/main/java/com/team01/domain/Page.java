package com.team01.domain;

public class Page {
    private int pageTotal;
    private int currentPage;//当前页
    private int pageSize=6;//页面大小
    private int pageIndex;

    public Page(){


    }

    public Page(int currentPage,int pageCount) {
        this.pageTotal =pageCount/pageSize+1;
        this.pageIndex = (currentPage-1)*pageSize;
    }

    public int getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(int pageTotal) {
        this.pageTotal = pageTotal;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageCount() {
        return pageIndex;
    }

    public void setPageCount(int pageCount) {
        this.pageIndex = pageCount;
    }
}
