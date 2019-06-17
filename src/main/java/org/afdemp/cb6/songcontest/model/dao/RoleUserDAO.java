/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.afdemp.cb6.songcontest.model.dao;

import java.util.List;
import org.afdemp.cb6.songcontest.model.entity.RoleUser;
import org.afdemp.cb6.songcontest.model.entity.User;


/**
 *
 * @author andre
 */
public interface RoleUserDAO {
   
    public void saveRoleUser(RoleUser roleuser);
    
    public RoleUser getRoleUserById(Long uid, User user);
    
    public void changeRole(RoleUser roleUser);
    
    
}
