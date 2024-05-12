import React, { useState } from 'react';
import { NavLink as RRNavLink } from "react-router-dom";
import { logout } from '../Managers/UserProfileManager';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink
} from 'reactstrap';


export default function Header({isLoggedIn, setIsLoggedIn}) {
  const [isOpen, setIsOpen] = useState(false);
  const toggle = () => setIsOpen(!isOpen);

  return (
    <div>
      <Navbar color="light" light expand="md">
        <NavbarBrand tag={RRNavLink} to="/">TechTribePro</NavbarBrand>
        <NavbarToggler onClick={toggle} />
        <Collapse isOpen={isOpen} navbar>
          <Nav className="mr-auto" navbar>
            { /* When isLoggedIn === true, we will render the Home link */ }
            {isLoggedIn && <>
              <NavItem>
                <NavLink tag={RRNavLink} to="/">Home</NavLink>
                
              </NavItem>
             {/* <NavItem>
             <NavLink tag={RRNavLink} to="/Posts">AllPosts</NavLink>
              </NavItem>
              <NavItem>
             <NavLink tag={RRNavLink} to="/my-posts">MyPosts</NavLink>
              </NavItem>
            
              
     
              <NavItem>
                <NavLink tag={RRNavLink} to="/categories">Category Management</NavLink>
              </NavItem> */}
              </>
            }
          </Nav>
          <Nav navbar>
            {isLoggedIn &&
              <>
                {/* <NavItem>
                  <NavLink tag={RRNavLink} to="/tag">Tag Management</NavLink>
                </NavItem>
                <NavItem>
                  <NavLink tag={RRNavLink} to="/users">User Profiles</NavLink>
                </NavItem> */}
                <NavItem>
                  <NavLink aria-current="page" className="nav-link"
                    style={{ cursor: "pointer" }} onClick={() => {
                      logout()
                      setIsLoggedIn(false)
                    }}>Logout</NavLink>
                </NavItem>
              </>
            }
            {!isLoggedIn &&
              <>
                <NavItem>
                  <NavLink tag={RRNavLink} to="/login">Login</NavLink>
                </NavItem>
                <NavItem>
                  <NavLink tag={RRNavLink} to="/register">Register</NavLink>
                </NavItem>
              </>
            }
          </Nav>
        </Collapse>
      </Navbar>
    </div>
  );
}