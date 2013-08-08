/**
 * 
 */
package com.hux.frame.core.activerecord;

import com.hux.frame.core.model.DataTablesModel;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.TableInfo;
import com.jfinal.plugin.activerecord.TableInfoMapping;

import java.util.*;

/**
 * @author huxiang
 * 
 */
@SuppressWarnings({ "rawtypes" })
public abstract class DbModel<T extends DbModel> extends Model<T> {

	private static final long serialVersionUID = -6215428115177000482L;

	private static final TableInfoMapping tableInfoMapping = TableInfoMapping
			.me();


	/**
	 * 用来针对DataTables封装的分页查询
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @param select
	 * @param sqlExceptSelect
	 * @param paras
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public DataTablesModel paginateDataTables(int pageNumber, int pageSize,
			String select, String sqlExceptSelect, Object... paras) {

		Page<T> pages = super.paginate(pageNumber, pageSize, select,
				sqlExceptSelect, paras);

		TableInfo tInfo = tableInfoMapping.getTableInfo(getClass());
		List<String> ids = new ArrayList<String>();
		List<List<String>> cells = new ArrayList<List<String>>();
		for (int i = 0; i < pages.getList().size(); i++) {
			T t = pages.getList().get(i);

			Map attrs = t.getAttrs();
			Set<String> key = attrs.keySet();
			List<String> cell = new ArrayList<String>();
			for (Iterator it = key.iterator(); it.hasNext();) {
				String s = (String) it.next();
				if (s.toLowerCase().equals(tInfo.getPrimaryKey().toLowerCase())) {
					ids.add(attrs.get(s).toString());
				} else {
					if (null != attrs.get(s)) {
						cell.add(attrs.get(s).toString());
					} else {
						cell.add("");
					}
				}
			}
			cells.add(cell);

		}

		return new DataTablesModel(pageNumber, pageSize, pages.getTotalRow(),
				ids, cells);
	}

	/**
	 * 用来针对DataTables封装的分页查询
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @param select
	 * @param sqlExceptSelect
	 * @return
	 */
	public DataTablesModel paginateDataTables(int pageNumber, int pageSize,
			String select, String sqlExceptSelect) {
		return this.paginateDataTables(pageNumber, pageSize, select,
				sqlExceptSelect, new Object[0]);
	}



}
