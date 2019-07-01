/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.afdemp.cb6.songcontest.controllers;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.afdemp.cb6.songcontest.model.dao.CheckBlocksDAO;
import org.afdemp.cb6.songcontest.model.dao.RelationUserDAO;
import org.afdemp.cb6.songcontest.model.dao.UserDAO;
import org.afdemp.cb6.songcontest.model.entity.Relation;
import org.afdemp.cb6.songcontest.model.entity.RelationUser;
import org.afdemp.cb6.songcontest.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author andre
 */
@Controller
public class RelationUserController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private RelationUserDAO relationUserDAO;

    @Autowired
    private CheckBlocksDAO checkBlocksDAO;

    @RequestMapping(value = "/viewProfilesUsers", method = RequestMethod.GET)
    public String viewProfilesOfUsers(HttpSession session, Model model) {
    	if(session.getAttribute("loguser") != null){
    		
    		return "profiles";
		}
    	else {
    		return "error";
    	}
    }
    
    @RequestMapping(value = "/searchForUsers")
    public ModelAndView searchForUsers(@RequestParam("text") String text, HttpSession session)
    {
        if(session.getAttribute("loguser") != null){
           
        	User logUser = (User) session.getAttribute("loguser");
        	
        	String firstname = "";
        	
        	String lastname = "";
        	
        	List<User> usersList = new ArrayList<>();
        	
        	List<RelationUser> relationUserList = new ArrayList<>();
        	
        	ModelAndView mv = new ModelAndView();
        	
        	if(StringUtils.containsWhitespace(text)) {
        		
        		String[] fullnames = text.split(" ");
        		
        		firstname = fullnames[0];
        		
        		lastname = fullnames[1];
        		
        		usersList = userDAO.getUsersBySearch(firstname, lastname, logUser);
        	}
        	else {
        		usersList = userDAO.getUsersBySearch(text, text, logUser);
        	}
        	
        	for (User user : usersList) {
                relationUserList.add(relationUserDAO.getRelationAmongUsers(logUser, user));
            }
        	String x = "ap";
        	mv.addObject("relationUserList", relationUserList);
        	mv.addObject("x", x);
        	mv.setViewName("search_users");
        	
            return mv;
        }
        else{
            return new ModelAndView("error");
        }
    }
    
   /* @RequestMapping(value = "/viewUsers/{page_id}", method = RequestMethod.GET)
    public String viewUsers(HttpSession session, Model model, @PathVariable("page_id") int page_id) {
        try {
            User logUser = (User) session.getAttribute("loguser");
            List<RelationUser> relationUserList = new ArrayList<>();
            int total = 3;
            int numOfPages = userDAO.getUsersCount()-total;
            int previousNext = 1;*/
            /*if (page_id == 1) {
                // do nothing!
            } else {
                page_id = (page_id - 1) * total + 1;
            }*/
           /* List<User> userList = userDAO.getUsersByPage(page_id, total);
            
            //userList.remove(0);
            for (int i = 0; i < userList.size(); i++) {
                if (userList.get(i).getUsername().equals(logUser.getUsername())  
                       ) {
                    userList.remove(i);
                }
            }
            for (User user : userList) {
                relationUserList.add(relationUserDAO.getRelationAmongUsers(logUser, user));
            }
            model.addAttribute("relationUserList", relationUserList);
            model.addAttribute("page_id", page_id);
            model.addAttribute("numOfPages", numOfPages);
            model.addAttribute("previousNext", previousNext);
            if (session.getAttribute("loguser") != null) {
                return "viewprofileusers";
            } else {
                return "error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }*/

    @RequestMapping(value = "/friendRequest/{uid}")
    public ModelAndView makeFriendRequest(User userTwo, @PathVariable("uid") Long uid, HttpSession session) {
    	ModelAndView mv = new ModelAndView();
    	try {
            User userOne = (User) session.getAttribute("loguser");
            userTwo = userDAO.getUserById(uid);
            RelationUser relationUser = new RelationUser();
            relationUser.setUserOne(userOne);
            relationUser.setUserTwo(userTwo);
            relationUserDAO.makeFriendRequest(relationUser);
            relationUser = relationUserDAO.getRelationAmongUsers(userOne, userTwo);
            mv.addObject("relationUser", relationUser);
            mv.setViewName("status");
            return mv;
        } catch (Exception e) {
            return new ModelAndView("status");
        }
    }

    @RequestMapping(value = "/deleteRelation/{uid}")
    public ModelAndView deleteFriend(User userTwo, @PathVariable("uid") Long uid, HttpSession session) {
    	ModelAndView mv = new ModelAndView();
    	try {
            User userOne = (User) session.getAttribute("loguser");
            userTwo = userDAO.getUserById(uid);
            RelationUser relationUser = new RelationUser();
            relationUser.setUserOne(userOne);
            relationUser.setUserTwo(userTwo);
            relationUserDAO.deleteFriend(relationUser);
            relationUser = relationUserDAO.getRelationAmongUsers(userOne, userTwo);
            mv.addObject("relationUser", relationUser);
            mv.setViewName("status");
            return mv;
        } catch (Exception e) {
            return new ModelAndView("status");
        }
    }

    @RequestMapping(value = "/acceptFriendRequest/{uid}")
    public ModelAndView acceptFriendRequest(User userTwo, @PathVariable("uid") Long uid, HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	try {
            User userOne = (User) session.getAttribute("loguser");
            userTwo = userDAO.getUserById(uid);
            RelationUser relationUser = relationUserDAO.getRelationAmongUsers(userOne, userTwo);
            relationUserDAO.acceptFriendRequest(relationUser);
            relationUser = relationUserDAO.getRelationAmongUsers(userOne, userTwo);
            mv.addObject("relationUser", relationUser);
            mv.setViewName("status");
            return mv;
        } catch (Exception e) {
            return new ModelAndView("status");
        }
    }

    /*@RequestMapping(value = "/acceptFriendRequest//{uid}")
    public ModelAndView bugAacceptFriendRequest() {
        return new ModelAndView("redirect:/viewProfilesUsers");
    }*/

    @RequestMapping(value = "/blockUser/{uid}")
    public ModelAndView blockUnblock( User userTwo, @PathVariable("uid") Long uid, HttpSession session) throws Exception {
        try {
        	
        	ModelAndView mv = new ModelAndView();
        	User userOne = (User) session.getAttribute("loguser");
        	userTwo = userDAO.getUserById(uid);
        	RelationUser relationUser =  relationUserDAO.getRelationAmongUsers(userOne, userTwo);
            if (relationUser.getStatus().getIdrel() == 2 || relationUser.getStatus().getIdrel() == 3) {                               
                relationUser.setUserOne(userOne);
                relationUser.setUserTwo(userTwo);
                Relation relation = Relation.getRelationFor(relationUser.getStatus().getIdrel());
                if (relation.getIdrel() == 2) {
                    relationUser.setStatus(Relation.BLOCKED);
                    checkBlocksDAO.createCheckBlock(userOne, userTwo);
                } else {
                    User blocker = checkBlocksDAO.getBlocker(userOne, userTwo);
                    if (blocker.getUid() != null) {
                        relationUser.setStatus(Relation.ACCEPTED);
                        checkBlocksDAO.removeCheckBlock(userOne, userTwo);
                    }
                }
                try {
                    relationUserDAO.blockUser(relationUser);
                } catch (Exception e) {
                    e.getMessage();
                }
            }
            relationUser = relationUserDAO.getRelationAmongUsers(userOne, userTwo);
            
            mv.addObject("relationUser", relationUser);
            
            mv.setViewName("status");
            
            return mv;
        } catch (Exception e) {
            return new ModelAndView("status");
        }
    }

    /*@RequestMapping(value = "/blockUser//{uid}")
    public ModelAndView bugBlockUnblock() {
        return new ModelAndView("status");
    }*/
}
