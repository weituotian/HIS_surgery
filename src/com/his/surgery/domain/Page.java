package com.his.surgery.domain;
import com.his.surgery.entity.Anaesthesia;
import org.apache.struts2.json.annotations.JSON;

import java.util.Iterator;
import java.util.List;

/**
 * 与具体ORM实现无关的分页查询结果封装.
 * 
 * @param <T> Page中记录的类型.
 * @author DD
 */
public class Page<T> extends PageRequest implements Iterable<T> {//implements Iterable<T>

    //结果list
	protected List<T> result = null;
    //总共记录数
	protected long totalItems = -1;
    //总共分页
    protected long totalPage;

    public Page() {

	}

	public Page(PageRequest request) {
		this.pageNo = request.pageNo;
		this.pageSize = request.pageSize;
	}
	
	public Page(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 获得页内的记录列表.
	 */
    @JSON(name = "lists")
	public List<T> getResult() {
		return result;
	}

	/**
	 * 设置页内的记录列表.
	 */
	public void setResult(final List<T> result) {
		this.result = result;
	}

	/**
	 * 获得总记录数, 默认值为-1.
	 */
    @JSON(name = "totalItems")
	public long getTotalItems() {
		return totalItems;
	}

	/**
	 * 设置总记录数.
	 */
	public void setTotalItems(final long totalItems) {
		this.totalItems = totalItems;
        this.totalPage= (int) Math.ceil((double) totalItems / (double) getPageSize());
	}


	/**
	 * 根据pageSize与totalItems计算总页数.
	 */
    public long getTotalPage() {
        return totalPage;
    }

    /**
	 * 是否还有下一页.
	 */
	public boolean hasNextPage() {
		return (getPageNo() + 1 <= getTotalPage());
	}

	/**
	 * 是否最后一页.
	 */
	public boolean isLastPage() {
		return !hasNextPage();
	}

	/**
	 * 取得下页的页号, 序号从1开始. 当前页为尾页时仍返回尾页序号.
	 */
	public int getNextPage() {
		if (hasNextPage()) {
			return getPageNo() + 1;
		} else {
			return getPageNo();
		}
	}

	/**
	 * 是否还有上一页.
	 */
	public boolean hasPrePage() {
		return (getPageNo() > 1);
	}

	/**
	 * 是否第一页.
	 */
	public boolean isFirstPage() {
		return !hasPrePage();
	}

	/**
	 * 取得上页的页号, 序号从1开始. 当前页为首页时返回首页序号.
	 */
	public int getPrePage() {
		if (hasPrePage()) {
			return getPageNo() - 1;
		} else {
			return getPageNo();
		}
	}

	public Iterator<T> iterator() {
		return result.iterator();
	}
	
}
