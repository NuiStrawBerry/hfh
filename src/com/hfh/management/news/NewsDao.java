package com.hfh.management.news;

import java.util.List;



import com.hfh.bean.News;

public interface NewsDao {
	
	/**
	 * 
	 * @description 新增修改招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param job
	 * @return
	 */
	public boolean addAndEditNews(final News job);
	
	/**
	 * 
	 * @description 删除招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param id
	 * @return
	 */
	public boolean deleteNews(String id);
	
	/**
	 *  
	 * @description 改变招聘信息的状态
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param id
	 * @param status
	 * @return
	 */
	public boolean changeStatus(String id,String status);
	
	/**
	 * 
	 * @description 获取指定的招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @param id
	 * @return
	 */
	public News getNews(String id);
	
	/**
	 * 
	 * @description 获取所有的招聘信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @return
	 */
	public List<News> getAllNews();
	
	/**
	 * 
	 * @description 获取发布的照片信息
	 * @user yzYang
	 * @date 2014年9月2日
	 * @return
	 */
	public List<News> getNews();
	
	public boolean isExit(String id );
	
	public boolean updateNews(final News job);
}
