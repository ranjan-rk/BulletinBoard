package com.springapp.bulletinboard.service.security;

import java.util.*;

import com.springapp.bulletinboard.User;
import com.springapp.bulletinboard.service.UserService;
import com.springapp.bulletinboard.service.security.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import static com.springapp.bulletinboard.User.Role.ADMINISTRATOR;
import static com.springapp.bulletinboard.User.Role.WRITER;

@Service("myUserDetailService")
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserService userService;

    private Map<String, UserDetails> getPermissions() {
        Map<String, UserDetails> userRepository = new HashMap<String, UserDetails>();

        GrantedAuthority authorityAdmin = new GrantedAuthorityImpl("ROLE_ADMIN");
        GrantedAuthority authorityUser = new GrantedAuthorityImpl("ROLE_USER");

        Set<GrantedAuthority> userPermissions = new HashSet<GrantedAuthority>();
        Set<GrantedAuthority> adminPermissions = new HashSet<GrantedAuthority>();

        userPermissions.add(authorityUser);
        adminPermissions.add(authorityAdmin);
        adminPermissions.add(authorityUser);

        List<User> users = userService.findAll();

        for (User user : users) {
            if (user.getRole().equals(ADMINISTRATOR)) {
                UserDetails userWithPermission = new UserDetailsImpl(user.getEmail(), user.getFirstName(), adminPermissions);
                userRepository.put(user.getEmail(), userWithPermission);
            } else if (user.getRole().equals(WRITER)) {
                UserDetails userWithPermission = new UserDetailsImpl(user.getEmail(), user.getFirstName(), userPermissions);
                userRepository.put(user.getEmail(), userWithPermission);
            }
        }
        return userRepository;
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetails matchingUser = getPermissions().get(username);

        if(matchingUser == null){
            throw new UsernameNotFoundException("Wrong username or password");
        }

        return matchingUser;
    }

}