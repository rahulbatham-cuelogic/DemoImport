//
//  StoryboardConstant.h
//  TravelPass
//
//  Created by Harshit Dongre on 23/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#ifndef StoryboardConstant_h
#define StoryboardConstant_h

/**
 STORYBOARD OBJECTS CREATED
 */
#define K_STORYBOARD_MAIN [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define K_STORYBOARD_HOTEL [UIStoryboard storyboardWithName:@"Hotel" bundle:nil]
#define K_STORYBOARD_PROFILE [UIStoryboard storyboardWithName:@"Profile" bundle:nil]
#define K_STORYBOARD_MESSAGE [UIStoryboard storyboardWithName:@"Messages" bundle:nil]
#define K_STORYBOARD_ITINARARY [UIStoryboard storyboardWithName:@"Itinarary" bundle:nil]
#define K_STORYBOARD_FAVOURITES [UIStoryboard storyboardWithName:@"Favourites" bundle:nil]


/**
 INSTANTIATE THE CONTROLLERS DIFFERENT STORYBOARDS
 */
#define K_INTANTIATE_MAINSTORYBOARD(v) [K_STORYBOARD_MAIN instantiateViewControllerWithIdentifier:v]
#define K_STORYBOARD_SIDEMENUCONTROLLER @"SideMenuController"
#define K_STORYBOARD_SIGNUPCONTROLLER @"SignUpViewController"

#define K_INTANTIATE_HOTELSTORYBOARD(v) [K_STORYBOARD_HOTEL instantiateViewControllerWithIdentifier:v]
#define K_STORYBOARD_HOTELCONTROLLER @"HotelsViewController"

#define K_STORYBOARD_CONTACTSCONTROLLER @"ContactViewController"

#define K_INTANTIATE_PROFILESTORYBOARD(v) [K_STORYBOARD_PROFILE instantiateViewControllerWithIdentifier:v]
#define K_STORYBOARD_PROFILECONTROLLER @"ProfileViewController"

#define K_INTANTIATE_MESSAGESTORYBOARD(v) [K_STORYBOARD_MESSAGE instantiateViewControllerWithIdentifier:v]
#define K_STORYBOARD_MESSAGECONTROLLER @"MessagesViewController"

#define K_INTANTIATE_FAVOURITESTORYBOARD(v) [K_STORYBOARD_FAVOURITES instantiateViewControllerWithIdentifier:v]
#define K_STORYBOARD_FAVOURITESCONTROLLER @"FavouritesViewController"

#define K_INTANTIATE_ITINARARYSTORYBOARD(v) [K_STORYBOARD_ITINARARY instantiateViewControllerWithIdentifier:v]
#define K_STORYBOARD_ITINARARYCONTROLLER @"ItinararyViewController"

#endif /* StoryboardConstant_h */
