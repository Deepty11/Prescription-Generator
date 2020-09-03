package com.rehnuma.web.UserStories.repostories;

import com.rehnuma.web.UserStories.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User,Integer> {
    User findByEmailAndPassword(String email, String password);
    User findByEmail(String email);
}
