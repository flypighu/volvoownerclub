/**
 * 
 */
package com.hux.frame.core.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

/**
 * datatables数据行
 * 
 * @author huxiang
 * 
 */
public class DataTablesRow implements Serializable {

	private String id;
	private List<String> cell;

	public DataTablesRow(){
		this.setCell(new ArrayList<String>());
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the cell
	 */
	public List<String> getCell() {
		return cell;
	}

	/**
	 * @param cell
	 *            the cell to set
	 */
	public void setCell(List<String> cell) {
		this.cell = cell;
	}

	public String toJSONString() {

		return JSONObject.fromObject(this).toString();
	}

}
