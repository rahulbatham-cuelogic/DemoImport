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
#define STORYBOARD_MAIN [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define STORYBOARD_HOTEL [UIStoryboard storyboardWithName:@"Hotel" bundle:nil]
#define STORYBOARD_PROFILE [UIStoryboard storyboardWithName:@"Profile" bundle:nil]
#define STORYBOARD_MESSAGE [UIStoryboard storyboardWithName:@"Messages" bundle:nil]
#define STORYBOARD_ITINARARY [UIStoryboard storyboardWithName:@"Itinarary" bundle:nil]
#define STORYBOARD_FAVOURITES [UIStoryboard storyboardWithName:@"Favourites" bundle:nil]


/**
 INSTANTIATE THE CONTROLLERS DIFFERENT STORYBOARDS
 */
#define INTANTIATE_MAINSTORYBOARD(v) [STORYBOARD_MAIN instantiateViewControllerWithIdentifier:v]
#define STORYBOARD_SIDEMENUCONTROLLER @"SideMenuController"
#define STORYBOARD_SIGNUPCONTROLLER @"SignUpViewController"

#define INTANTIATE_HOTELSTORYBOARD(v) [STORYBOARD_HOTEL instantiateViewControllerWithIdentifier:v]
#define STORYBOARD_HOTELCONTROLLER @"HotelsViewController"

#define STORYBOARD_CONTACTSCONTROLLER @"ContactViewController"

#define INTANTIATE_PROFILESTORYBOARD(v) [STORYBOARD_PROFILE instantiateViewControllerWithIdentifier:v]
#define STORYBOARD_PROFILECONTROLLER @"ProfileViewController"

#define INTANTIATE_MESSAGESTORYBOARD(v) [STORYBOARD_MESSAGE instantiateViewControllerWithIdentifier:v]
#define STORYBOARD_MESSAGECONTROLLER @"MessagesViewController"

#define INTANTIATE_FAVOURITESTORYBOARD(v) [STORYBOARD_FAVOURITES instantiateViewControllerWithIdentifier:v]
#define STORYBOARD_FAVOURITESCONTROLLER @"FavouritesViewController"

#define INTANTIATE_ITINARARYSTORYBOARD(v) [STORYBOARD_ITINARARY instantiateViewControllerWithIdentifier:v]
#define STORYBOARD_ITINARARYCONTROLLER @"ItinararyViewController"

#endif /* StoryboardConstant_h */
