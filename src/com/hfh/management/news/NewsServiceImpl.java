package com.hfh.management.news;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfh.bean.News;


@Service
public class NewsServiceImpl implements NewsService{

	private final Logger logger = Logger.getLogger(NewsServiceImpl.class);
	@Autowired
	private NewsDao newsDao;
	
	/**
	 * @see NewsService
	 */
	public boolean addAndEditNews(News news) {
		
		if(newsDao.isExit(news.getId())){
			return newsDao.updateNews(news);
		}else{
			return newsDao.addAndEditNews(news);
		}
	}
	
	@Override
	public boolean deleteNews(String id) {
		return newsDao.deleteNews(id);
	}
	
	@Override
	public boolean changeStatus(String id, String status) {
		return newsDao.changeStatus(id, status);
	}
	
	@Override
	public News getNews(String id) {
		return newsDao.getNews(id);
	}
	
	@Override
	public List<News> getAllNews() {
		return newsDao.getAllNews();
	}
	
	@Override
	public List<News> getNews() {
		return newsDao.getNews();
	}
}
