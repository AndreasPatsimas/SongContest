/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.afdemp.cb6.songcontest.model.dao;

import org.afdemp.cb6.songcontest.model.entity.User;


/**
 *
 * @author andre
 */
public interface CheckBlocksDAO {
    
    public User getBlocker(User userOne, User userTwo);
    
    public void createCheckBlock(User userOne, User userTwo);
    
    public void deleteCheckBlock(User userOne, User userTwo);
}