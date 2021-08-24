package com.team01.domain;

public class Page {
    private int pageTotal;
    private int currentPage;
    private int pageSize;

    public Page(){

    }

    public Page(int pageTotal, int currentPage, int pageSize) {
        this.pageTotal = pageTotal;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
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
}
