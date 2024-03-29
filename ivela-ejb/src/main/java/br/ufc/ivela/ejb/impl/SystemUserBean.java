/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.ufc.ivela.ejb.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.ejb.Stateless;

import br.ufc.ivela.commons.dao.DaoFactory;
import br.ufc.ivela.commons.dao.GenericDao;
import br.ufc.ivela.commons.model.Profile;
import br.ufc.ivela.commons.model.SystemUser;
import br.ufc.ivela.ejb.interfaces.SystemUserRemote;

/**
 *
 * @author Rodrigo Félix de Almeida / Leonardo Oliveira Moreira
 */
@Stateless(mappedName="SystemUserBean")
public class SystemUserBean implements SystemUserRemote {

    private GenericDao<SystemUser> daoSystemUser = DaoFactory.getInstance(SystemUser.class);
    private GenericDao<Profile> daoProfile = DaoFactory.getInstance(Profile.class);
    
    public boolean exists(String login){        
        List result = daoSystemUser.find("from SystemUser s where s.username = ?", new Object[]{login});
        
        if(result != null && result.size() > 0){
            return true;
        }
        
        return false;
    }
    
    public SystemUser get(Long systemUserId) {
        return daoSystemUser.get(systemUserId); 
    }
    
    public Profile getProfile(Long systemUserId){
        return (Profile)daoProfile.getByFK("system_user.id", systemUserId);
    }

    public List<SystemUser> list() {
        return daoSystemUser.getAll();
    }

    public Long add(SystemUser su) {
        su.setEnabled(true);
        su.setCreatedAt(new Date());
        return (Long) daoSystemUser.save(su);
    }

    public boolean remove(Long systemUserId) {
        return daoSystemUser.remove(systemUserId);
    }

    public String encrypt(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            return new String(hexCodes(md.digest(password.getBytes())));
        } 
        catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(SystemUserBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    /**
     * Method used to transform a string of bytes in the format in an array of hexadecimal characters
     * 
     * @param text
     * @return
     */
    private static char[] hexCodes(byte[] text) {
        char[] hexOutput = new char[text.length * 2];
        String hexString;
        for (int i = 0; i < text.length; i++) {
            hexString = "00" + Integer.toHexString(text[i]);
            hexString.getChars(hexString.length() - 2, hexString.length(), hexOutput, i * 2);
        }
        return hexOutput;
    }

    /**
     * updates a system user
     * @param user
     * @return true, if everything worked
     *         false, otherwise
     */ 
    public boolean update(SystemUser user) {
        return daoSystemUser.update(user);
    }

    public List<SystemUser> getAll() {
        return daoSystemUser.getAll();
    }

    public List<SystemUser> getByAuthentication(Long authenticationId) {        
    	List<SystemUser> users = daoSystemUser.find("select s from SystemUser s where s.authentication.id  = ? and s.enabled = true", new Object[]{authenticationId});
    	Collections.sort(users,new Comparator<SystemUser>() {

			public int compare(SystemUser arg0, SystemUser arg1) {
				return arg0.getUsername().compareToIgnoreCase(arg1.getUsername());
			}
    		
    	});
    	return users;
    }

    public List<SystemUser> getByUsername(String username) {
    	List<SystemUser> users = (List<SystemUser>) daoSystemUser.find("select su from SystemUser su where upper(su.username) = ? and su.enabled = true", new Object[] { username.toUpperCase() });
    	Collections.sort(users,new Comparator<SystemUser>() {

			public int compare(SystemUser arg0, SystemUser arg1) {
				return arg0.getUsername().compareToIgnoreCase(arg1.getUsername());
			}
    		
    	});
    	return users;
    }
    
    public List<SystemUser> getByUsernameByAuthentication(String username,Long authenticationId) {
    	List<SystemUser> users = (List<SystemUser>) daoSystemUser.find("select su from SystemUser su where upper(su.username) LIKE  ? and su.authentication.id  = ? and su.enabled = true", new Object[] { username.toUpperCase()+ "%",authenticationId });
    	Collections.sort(users,new Comparator<SystemUser>() {

			public int compare(SystemUser arg0, SystemUser arg1) {
				return arg0.getUsername().compareToIgnoreCase(arg1.getUsername());
			}
    		
    	});
    	return users;
    }
    
    public List<SystemUser> getUsersByUsername(String username) {
    	List<SystemUser> users = (List<SystemUser>) daoSystemUser.find("select su from SystemUser su where upper(su.username) LIKE ? and su.enabled = true", new Object[] { username.toUpperCase() + "%" });
    	Collections.sort(users,new Comparator<SystemUser>() {

			public int compare(SystemUser arg0, SystemUser arg1) {
				return arg0.getUsername().compareToIgnoreCase(arg1.getUsername());
			}
    		
    	});
    	return users;
    }
    
}