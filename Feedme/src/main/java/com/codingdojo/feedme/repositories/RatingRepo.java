package com.codingdojo.feedme.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.feedme.models.Rating;






@Repository
public interface RatingRepo extends CrudRepository<Rating,Long>
{
	List<Rating>findAll(); 
	
	@Query(value = "SELECT r.rest_name, AVG(ra.stars) AS average_stars \r\n"
			+ "                   FROM resturants r  \r\n"
			+ "                   JOIN ratings ra ON r.id = ra.resturant_id \r\n"
			+ "                   GROUP BY r.rest_name", nativeQuery = true)
	List<Object[]> findAverageStarsPerRestaurant();
	
	
	
}