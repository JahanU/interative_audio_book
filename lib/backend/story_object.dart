List<Story> allStories = [];

class Story {
  final String title;
  final String story;
  final String image;

  Story(this.title, this.story, this.image);
}

void createObject() {
  var _titles = [
    "2240 Space odyssey",
    "Whispers in the Dark (B)",
    "Story of Sparta (C)"
  ];
  var _stories = [
    """In 2240, humanity has been traveling through deep space in a spaceship to reach a new home,
  planet 12Z-51 since the Earth has been overpopulated and natural resources have been significantly exhausted.
  3000 crew members and 2500 citizens are on board. Currently, 200 citizens and 80 crew members including you are awake
  from the cryogenic chamber while the remaining others are set to wake upon the arrival.
  You are the commander of the ship, second in command. You are in the navigation bridge with 20 other crew members.
  “Congratulation, we are on the half-way to our destination. Great job, everyone. Keep up the work!”,
  says the commander in chief (CINC) as he walks into the bridge. Everyone salutes to the CINC. The CINC then comes towards you and says,
   “Well done, commander.” And you reply, “No sir, it’s all thanks to you.”. The CINC recommends,
   “You should get some rest. I can take it from here.
   Do you rest or reject ?""",

    """Story 2""",
    """Story 3"""
  ];


  var _images = [
    'https://i.imgur.com/k4qN5e3.jpg',
    'https://static.turbosquid.com/Preview/001242/868/9P/dark-horror-hospital-room-model_D.jpg',
    'http://etc.ancient.eu/wp-content/uploads/2016/08/MV5BMTI2OTA1MTEzMV5BMl5BanBnXkFtZTcwMzg1NTIyMw@@._V1_SX1777_CR001777927_AL_.jpg'
  ];

  for (int i = 0; i < _titles.length; i++) {
    allStories.add(new Story(_titles[i], _stories[i], _images[i]));
  }
}

var storyOneAnswers = [
  'take some rest raft',  // Intro
  'open the door',   // Section 1 response 1
  'follow the CINC’s order and evacuate.', // Section 2 response 1
];
var storyOneAnswersPart2 = [
  'reject the CINC’ s recommendation',   // Intro
  'find a place to hide', // Section 1 response 2
  'deny the CINC’s order and go to the weapon storage room. ',  // Section 2 response 1
];

var storyOne = [
  // Section 1
  """You reply to the CINC, “Okay, sir.” and you go to your dormitory to take a nap. In order to go to your dormitory, you must go across the main hall, full of infrastructure such as restaurants and movie theaters. As you walk across the main hall, you can see a lot of citizens hanging out. Once you have reached your dormitory, you lay down on your bed and slowly close your eyes and the darkness comes. Unknown amount of time has passed, and you suddenly hear the disturbing sound of alarm, “eeeoooeeoooeee”. You open your eyes and you decide to head back to the navigation bridge. As you run across the main hall, you see no signs of people as if they all had vanished. You realize something is up and rush towards the bridge. You have reached the entrance of the bridge. In order to open the door, you have to put your hand on the biometric scanner, but you suddenly hear the sound of footsteps coming from behind. The sound keeps getting louder and louder.
  Do you open the door or find a place to hide ?""",

  // Section 3
  """You put your hand on the biometric scanner and as the door slowly opens, you see a silhouette casted in front of you. As you turn around to identify the unknown figure, “Bang!!”. You have died by the laser-gun, shot by an extraterrestrial. Restart the game.  """,

  // Section 5
  """You reply, “Yes, sir.”. You head towards your assigned space capsule. You enter the capsule and its protective glass closes. You see people around you in chaos and panic through the glass. They are desperately trying to find their capsules. You are then ejected into the dark space towards the T05-102. As you gets far away from the ship, you can see thousands of space capsules ejecting from the ship. Now, your capsule slowly enters the atmosphere and red-yellowish flare starts to cover the entire capsule. To be continued… """,
];

var storyOnePart2 = [
  // Section 2
      """You reply to the CINC, “I’m fine, sir. Thanks for your concern.”. The CINC gives a pat on your shoulder. Suddenly, the entire ship starts to shake as if the earthquake has occurred. The CINC shouts loudly, “What’s going on?”. One of the crew members at the front says, “Sir, our ship is experiencing a heavy turbulence. The cause is unknown.”. Then, the another crew member shouts, “Our engines have shut down!”. As if crew members have promised each other, they all begin to burst out all kinds of problems happening in the ship: “Our electronic systems have shut down!”, “We are losing air pressure!”. The CINC angrily asks, “Someone please tell me what the hell is going on?”. Right after he finishes his sentence, you hear a loud bang which seems to originate from the tail section of the ship. One crew member shouts, “There is a security breach in the tail section. Multiple unknown hostiles have entered our ship. They are armed with some sort of laser-type guns. What should we do sir?”. The CINC says in a serious tone, “Everyone listen up. Initiate emergency protocol. We are abandoning the ship.”. The emergency protocol means that every personnel needs to enter a space capsule which then ejects from the ship and flies towards a particular destination. You rebut, “But, sir, how about the people in the cryogenic chamber? And also, how will we get to the 12Z-51 without this ship?12Z-15 is 100 light years away.” The CINC replies, “Do not worry about the people in the cryogenic chambers, commander. Each one will be automatically transported to a space capsule by the AI system of the ship. We think about the 12Z-51 later. We first have to do a emergency landing on a nearby habitable planet T05-102. We have no choice”. You refute, “Why don’t we fight them off? We have weapons too.”. The CINC grabs your shoulders and yells, “Commander!! Wake up. We do not know what we are up against. We cannot take any risks. My job is not killing extraterrestrial enemies but keeping everyone’s safety. Understand? So, follow my order.”.
      Do you follow the CINC’s order and evacuate or 
      Deny the CINC’s order and go to the weapon storage room?""",

  // Section 4
      """You decide to find a safe place to hide. You run as quietly as possible back towards the main hall. You go inside a random restaurant and hide behind the desk. You think to yourself, “What should I do?”. After a moment, you are determined to go to the surveillance room to check out what had happened people inside the ship. To be continued…""",

  // Section 6
      """You deny, “Sorry, sir. I am not going to retreat without a fight. We have to protect this ship no matter what.”. You command several crew members who agree with your idea to wear a oxygen mask and follow. Fortunately, you and the crew members have reached the weapon storage room safely and have obtained several guns. You and the crew members run towards the tailed section and see groups of unknown extraterrestrials shooting at the citizens. You and the crew members shoot back. After a long intense shootout, the extraterrestrials have all died. You communicate with the CINC by the radio, “Sir, we have killed all the extraterrestrials. We just need our engineers to fix the damage in the tail section. So, stop the emergency protocol immediately and do not eject the space capsules.”. However, you hear no response and you turn your head, looking outside the transparent window of the ship. You realize you are too late to stop people ejecting from the ship. To be continued……""",

];