import 'dart:math';

class gameList {
  // Universal List
  List uList = [
    "Caleb hints that he's gay",
    'Liza regrets marrying Kyle',
    'Game time gets tense',
    'No vegan options for Teague',
    'Somebody cries during prayer',
    'Dinner starts 10+ minutes late',
    'Somebody talks about college',
    'Somebody gets drunk',
    'An awkward silence occurs',
    'Someone loses Ming-O',
    'Someone is sabotaged in a game',
    'Teague gets anxiety',
    'Rachel is facetimed',
    'Teague defends Isabel',
    'Going to the bar is suggested',
    'There is no more cider',
    'The meat is dry',
    'An NPC leaves the event early',
    'An NPC is late',
    'NPC coughs or sneezes loudly',
    'A dish is broken',
    'Somebody is caught playing\n Ming-O',
    'NPC ask controversial question',
    "Caleb's voice cracks",
    'NPCs show fake sympathy',
    'Corrin is not called Donny by NPC',
    'Someone says “mm” at prayer',
    'A picture has to be retaken',
    'Blood is drawn',
    'Somebody wears festive attire', //Might be specific attire (undecided)
    'Maryssa frowns',
    'NPC asks when player is getting engaged',
    'Corrin is a frat boy',
    'Alex wears floral shirt',
    'Someone gives Emmett rapid kisses',
    'The death of Kiwi is mentioned',
  ];

  // Laura List
  List lList = [
    'Laura is intoxicated',
    'Laura takes a nap',
    'Laura arrives late',
    'Laura talks about her friends',
    'Laura is missing',
    'Laura talks about work',
    'Laura gets touchy',
    'Laura rejects concerns for her wellbeing',
    'Laura eats less than others',
    'Laura falls',
    'Laura talks about her appearance',
    'Laura asks where Isabel is',
    'Laura talks to Kiwi',
    'Laura gives random gifts'
  ];

  // Oma List
  List oList = [
    'Oma comments on others parenting',
    'Oma cries',
    'Oma references a Bible verse',
    'Oma talks about abortion',
    'Oma talks about vaccines',
    'Oma talks about politics',
    'Oma talks about jail',
    'Oma states she’s clueless',
    'Oma begs someone to move back to Aiken',
    'Oma mentions her time is near',
    'Oma says something is not of the Lord',
    'Oma needs game clarification',
    'Oma judges Isabel',
    'Oma compliments the food',
    'Oma mentions her lack of taste',
  ];

  // Edl List
  List eList = [
    'Heather rejects a compliment',
    'David only visibly shows \n disagreement',
    'Heather talks about vaccines',
    'Heather doesn’t get to the point',
    'Heather talks about her diet',
    'David laughs too hard at something',
    'David gives Heather look of\n disapproval',
    'Heather gives David look of\n disapproval',
    'Heather gossips',
    'David prays',
    'David leans back to look at phone',
    'Heather tries to stay\n relevant',
    'David sighs',
    'Heather gasps',
    'Heather takes too many pictures',
    'Heather looks at facebook',
    'Heather shows facebook post',
    'David is left out',
    'Heather touches up her makeup',
    'Heather comments on her outfit',
  ];

  // Rothwell List
  List rList = [
    'Don falls asleep',
    'Diane insist on washing dishes',
    'Don changes the topic',
    'Diane tells you to stop helping',
    'Diane does a deep gasp',
    'Diane gets sarcastic',
    'Don mentions hunting',
    'Diane is getting visibly stressed',
    'Diane/Don gushes about Tarrah',
    'Rothwells need to leave early',
    "Rothwell's leave later than expected",
    'Diane pulls Laura aside',
    'Diane talks about not having enough\n vacation',
  ];

  List fList = [
    'NPC underdressed or dramatically dressed',
    'NPC is drunk',
    'Technical Difficulties',
    'NPC cries loudly',
    'Selfie with the deceased',
    'Awkward pew shuffle',
    '"How are you doing?" ',
    "Meet 3 NPCs you don't know",
    '"I remember when you were a baby"',
    "'They're in a better place'",
    'Insensitive joke is made',
    'Skip the burial',
    "Cars don't stop for procession",
    'NPC is eager to leave',
    'NPC wants to go to a restaurant',
    '"Who invited this person?"',
    'Rainy day',
    'Kid playing on phone / tablet',
    'Awkward touch',
    'NPC gossips about deceased',
    'Bible verse quoted',
    "You're mistaken for someone else",
    "NPC's argue over the will",
    'Ex-Lover attends funeral',
    'Amazing grace is not sung',
    'Priest tells awkward joke',
    '"They died too soon"',
    'NPC overstays welcome',
    'A hug leads to crying',
    'Awkard cough / sneeze',
    'NPC is a loud nose blower',
    "'I didn't like them anyways'",
    '"They owed me money"',
  ];
  List bList = [
    "NPC's have sex in the bathroom",
    'NPC gets touchy',
    'Bar has live music',
    'Get drunk',
    'Someone throws up',
    'NPC insist on driving drunk',
    'Cops are called',
    'Song plays that nobody vibes with',
    'NPC buys you a drink',
    "Bar doesn't have what you want",
    'Bar forgets your drink',
    'Couple being too handsy',
    'Bartender gets flirty',
    'NPC gets flirty',
    "NPC thinks you're someone else",
    'Fight breaks out',
    "NPC's chant 'Shots! Shots! Shots!'",
    'NPC pissed their pants',
    'NPC falls over',
    "NPC won't shut up",
    'NPC laughs outrageously',
    "NPC's go to Waffle House",
    "NPC's are bar hopping",
    'Roofie attempt is made',
    'NPC is on drugs',
    'Someone cries',
    'Music is too loud',
    'Tacky shit tacked on the wall',
    'NPC wearing a bandana',
    'Motorcycle crew rolls in',
    'NPC has a mullet',
    'Bathroom has graffiti',
    'Call the number on the bathroom stall',
    'Drunk NPC dances alone',
    'Dollar bill on the wall',
    'Bathroom stall door missing',
    'Group of frat / srat are present',
    'NPC is clearly underage',
    '"Light ice"',
    "There's a popcorn machine",
    'Someone orders just a soda / water',
    'No toilet paper in the bathroom',
    'Shit not in the toilet',
    'A toilet is clogged',
    'Bar food is cold / lukewarm',
    'NPC is a birthday boy/girl',
    'Lost purse / wallet / card / cash',
    'Drunk NPC leaves to walk around town',
    'NPC is showing lots of chest hair',
    'NPC has a tramp stamp',
    'NPC has a neck tattoo',
    'NPC is bar hopping',
  ];
  List pList = [
    "NPC's have sex in the bathroom",
    'NPC gets touchy',
    '"Who invited this NPC?"',
    'Get drunk',
    'Someone throws up',
    'NPC insist on driving drunk',
    'Cops are called',
    'Song plays that nobody vibes with',
    'NPC arrives late',
    'NPC goes on a beer run',
    'NPC is asleep on couch',
    'NPC gets flirty',
    'You spot a loner NPC',
    'Fight breaks out',
    'Host kicks someone out',
    "NPC's gossip about other guest",
    'A party game is played',
    "NPC won't shut up",
    'Cupid Shuffle is played',
    "NPC's go to Waffle House",
    "NPC's are party hopping",
    'Roofie attempt is made',
    'NPC is on drugs',
    'Someone cries',
    'Music is too loud',
    'NPC orders their own food',
    'Couple being too handsy',
    'NPC does a magic trick',
    'NPC tries to show off dance moves',
    'NPC hurts themselves while dancing',
    'Place gets trashed',
    'Host wants guest to clean up',
    'Host leaves the party',
    'Too dark in the room',
    'NPC bumps into you',
    'Something breaks',
    'Someone screams for no reason',
  ];

  // Universal Description
  List uDescription = [
    "Caleb makes a subtle reference to his sexuality or defends his sexuality in conversation with NPCs",
    'Kyle says or does something that Liza reacts negatively to',
    'People raise their voices or get angry during a board game or Ming-O',
    'This only applies to NPCs not bringing a vegan friendly food items',
    'Somebody cries during prayer',
    'Dinner starts 10+ minutes late',
    'This must occur naturally in conversation',
    'This can be done intentionally to qualify',
    'An awkward silence occurs',
    'Someone loses Ming-O',
    'Any game including Ming-O counts',
    'If naturally Teague mentions getting anxiety, this tile is qualified',
    'If Rachel gets facetimed, whether she picks up or not, this tile is qualified',
    'Teague stands up for Isabel if an NPC says something in a negative light regarding her',
    'If someone suggest going to the bar, this tile is qualified',
    'If there is no more cider, this tile is qualified',
    'The meat must be commented by multiple people or NPCs that it is dry',
    'If an NPC leaves the event and is the only one to have left for the next 30 minutes, the tile is qualified',
    'If an NPC arrives 15 minutes past call time, this tile is qualified',
    'If an NPC coughs or sneezes loudly, this tile is qualified',
    'This can be done intentionally or happen naturally. If a dish is broken, this tile is qualified',
    'If someone is caught playing Ming-O by an NPC, this tile is qualified',
    'If NPC asked a controversial question, this tile is qualified (Hot Takes)',
    "If Caleb’s puberty reverts, this tile is qualified",
    'This only applies if NPC calls Donny by the name of Corrin. If this is the case, this tile is qualified',
    'If someone, NPC or Ming-O player, says “mm” during prayer, this tile is qualified',
    'Someone says “mm” at prayer',
    'If a picture is retaken for any reason, this tile is qualified',
    'If blood is drawn by anybody, this tile is qualified',
    'Somebody is festive', //Might be specific attire (undecided)
    'Maryssa frowns',
    'NPC asks when player is getting engaged',
    'If Corrin talks about his frat life, this tile is qualified',
    'If Alex is showing off his sexuality, this tile is qualified',
    'Someone gives Emmett rapid kisses',
    'The death of Kiwi is mentioned',
  ];

  // Laura Description
  List lDescription = [
    'If Laura is intoxicated, this tile is qualified',
    'If Laura takes a nap, this tile is qualified',
    'If Laura arrives late, this tile is qualified',
    'Laura mentions activities she has done with friends',
    'aura disappears for more than a 15 minute period',
    'If Laura talks about work, this tile is qualified',
    'If Laura hugs someone for more than 5 seconds or touches anyone else in an uncomfortable manner, this tile is qualified.',
    'If someone mentions an issue with Laura and she says she is fine or counters the other person, this tile is qualified',
    'If Laura has a noticeably smaller amount of food on her plate, this tile is qualified',
    'f Laura falls, this tile is qualified',
    'If Laura talks about how she looks or how she envy’s someone else’s appearance, this tile is qualified',
    'If Laura asks about the whereabouts of Isabel, this tile is qualified',
    'If Laura is having a sentimental conversation with Kiwi, this tile is qualified',
    'Laura gives random gifts'
  ];

  // Oma Description
  List oDescription = [
    "Oma states a concern about someone's parenting (likely Kyle and Liza)",
    'If Oma cries, this tile is qualified',
    'If Oma make makes any reference or connection to a Bible verse, this tile is qualified',
    'If Oma mentions abortion, this tile is qualified',
    'If Oma talks about vaccines, this tile is qualified',
    'If Oma mentions something political, this tile is qualified',
    'If Oma talks about a jail experience, this tile is qualified',
    'If Oma cannot contribute to the conversation and mentions it, this tile is qualified',
    'If Oma mentions wanting people to move back to Aiken more than once, this tile is qualified',
    'If Oma mentions that she will soon not be alive, this tile is qualified',
    'If Oma says something is a sin or that it “opens doors”, this tile is qualified',
    'If Oma needs assistance with a game, this tile is qualified',
    'Oma judges Isabel',
    'Oma compliments food',
    'If Oma mentions her lack of taste, this tile is qualified.',
  ];

  // Edl Description
  List eDescription = [
    'If someone compliments Heather and she disagrees, this tile is qualified',
    'If someone is talking about a controversial topic with David present and he doesn’t add to the conversation, this tile is qualified',
    'If Heather mentions vaccines, this tile is qualified',
    'If Heather is talking for more than 15 seconds without getting to the point, this tile is qualified',
    'If Heather mentions she’s dieting, this tile is qualified',
    'If David laughs for longer than 3 seconds after everyone else, this tile is qualified',
    'If David looks at Heather with a look of disapproval, such as a raised eyebrow or soft frown, this tile is qualified',
    'If Heatherlooks at Heather with a look of disapproval, such as a raised eyebrow or soft frown, this tile is qualified',
    "If Heather gossips or talks about someone behind another's back, this tile is qualified",
    'If David says the prayer, this tile is qualified',
    'If David leans back to look at his phone or someone elses phone, this tile is qualified',
    'Heather says or does something that doesn’t suit her for her age, this tile is qualified',
    'If David sighs, this tile is qualified',
    'If Heather gasps, this tile is qualified',
    'If Heather takes more than 5 pictures on her phone within a 30 minute time frame, this tile is qualified',
    'Heather looks at facebook',
    'If Heather shows facebook post',
    'If David is left out of the conversation',
    'Heather touches up her makeup',
    'Heather comments on her outfit',
  ];

  // Rothwell Description
  List rDescription = [
    'If Don falls asleep, this tile is qualified',
    'If Diane insist on washing dishes, this tile is qualified',
    'If Don changes the topic in the middle of a conversation, this tile is qualified',
    'If Diane tells you, directly, to stop helping, this tile is qualified',
    'If Diane does a deep gasp, this tile is qualified',
    'If Diane says anything sarcastically, this tile is qualified',
    'If Don mentions hunting, this tile is qualified',
    'If Diane is showing signs of being stressed, this tile is qualified',
    'Diane/Don gushes about Tarrah',
    'Rothwells need to leave early',
    "Rothwell's leave later than expected",
    'Diane pulls Laura aside',
    'Diane talks about not having enough vacation',
  ];

  List fDescription = [
    'NPC is underdressed for the funeral or dramatically overdressed for the funeral.',
    'NPC is drunk at any point during the funeral.',
    "Mic cuts out, music doesn't play, mic too low, etc.",
    'NPC cries loudly.',
    'A selfie is taken with the deceased.',
    'Awkward pew shuffle occurs so someone can get in or out.',
    '"How are you doing?" is asked to you or an NPC. \n You must hear this being asked.',
    "Meet 3 NPCs you don't know.",
    '"I remember when you were a baby" is said to you directly.',
    "'They're in a better place' is said at the funeral.",
    'You or another makes an insensitive joke.',
    'You decide to not join the procession to the burial site and do not stick around for the burial',
    'Precisely what the tile says',
    'NPC is eager to leave the funeral. The NPC must make a clear comment stating this.',
    'NPC wants to go to a restaurant. The NPC must make a clear comment stating this.',
    '"Who invited this person?" or something of that sort is asked. \n You must hear this being asked.',
    "It's raining during the funeral / burial.",
    'Precisely what the tile says.',
    'You are touched awkwardly by an NPC.',
    'NPC gossips about deceased. \n You must hear this in a discussion.',
    'Bible verse is quoted. \n You must hear this.',
    "You're mistaken for someone else.",
    "NPC's argue over the will. \n You must witness this happening.",
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    '"They died too soon" is said. \n You must hear this being said.',
    'Precisely what the tile says.',
    'A hug leads to crying. \n You must witness this happening.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    "'I didn't like them anyways' is said. \n You must hear this being said.",
    '"They owed me money" is said. \n You must hear this being said.',
  ];
  List bDescription = [
    "NPC's have sex in the bathroom. \n You must witness this happening either by hearing or seeing.",
    'NPC gets touchy. This must be witnessed. If any NPC is getting touchy with another (or you), this tile is valid.',
    'Precisely what the tile says.',
    "This is an easy one. Just keep drinking until you know you're drunk. Tipsy or buzzed do not apply!",
    'An NPC or you throw up.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Song plays that nobody vibes with. Nobody means nobody. If someone is having a good time, you cannot check this tile off.',
    'Precisely what the tile says.',
    "Bar doesn't have what you want. This applies to actual bar drinks. You cannot be denied a pint of goose blood and check off this tile!",
    'Precisely what the tile says.',
    'Hand down pants, hand under the shirt, tongue kissing, tit grabbing, dick grinding, or butt touching all apply',
    'Bartender gets flirty. This can apply to you or an NPC. \n You must witness this happen.',
    'NPC gets flirty. This can apply to your or an NPC. \n You must witness this happen.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    "Precisely what the tile says. However, the chant doesn't have to be exactly 3 times. The chant just needs to be a valid chant.",
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    "NPC won't stop talking to you or others. This must be witnessed to apply.",
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'If you cannot hear yourself talk, this tile applies.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Motorcycle crew rolls in',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Call the number on the bathroom stall. You do not have to get an answer, you just need to have made an attempt.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    "Group of frat / srat are present. If it's just a group of college kids, this also can apply.",
    'NPC is clearly underage. If you cannot prove that they are underage, you need 3 people to agree they seem to be underage.',
    '"Light ice" is requested. \n You must hear this or say this.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
  ];
  List pDescription = [
    "NPC's have sex in the bathroom. \n You must witness this happening either by hearing or seeing.",
    'NPC gets touchy. This must be witnessed. If any NPC is getting touchy with another (or you), this tile is valid.',
    "'Who invited this NPC?' or something of that sort is asked. \n You must hear this being asked.",
    "This is an easy one. Just keep drinking until you know you're drunk. Tipsy or buzzed do not apply!",
    'An NPC or you throw up.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Song plays that nobody vibes with. Nobody means nobody. If someone is having a good time, you cannot check this tile off.',
    'Precisely what the tile says.',
    "NPC goes on a beer run. If you're told to go on a beer run, make someone else do it.",
    'Precisely what the tile says.',
    'NPC gets flirty. This can apply to your or an NPC. \n You must witness this happen.',
    'You spot a loner NPC. This is someone who is alone most of the time, keeping to themselves, not bothering anybody.',
    'Precisely what the tile says.',
    'Host kicks someone out. This can be an NPC or you.',
    "NPC's gossip about other guest. \n You must hear gossip being said.",
    'Precisely what the tile says.',
    "NPC won't stop talking to you or others. This must be witnessed to apply.",
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Precisely what the tile says.',
    'Someone cries. This can be an NPC or you. It must be actual crying!',
    'If you cannot hear yourself talk, this tile applies.',
    'Precisely what the tile says.',
    'Hand down pants, hand under the shirt, tongue kissing, tit grabbing, dick grinding, or butt touching all apply',
    'NPC does a magic trick. \n You must witness this happening.',
    'NPC tries to show off dance moves. \n You must witness this happening.',
    'NPC hurts themselves while dancing. \n You must witness this happening.',
    'Precisely what the tile says.',
    'Host wants guest to clean up. \n You must hear this mentioned directly from the host.',
    'Precisely what the tile says.',
    'If you or an NPC has to turn on a flashlight to get around, this applies.',
    'Precisely what the tile says.',
    'If you or an NPC breaks something, this counts.',
    'If an you or an NPC scream for no reason, this applies.'
  ];

  List shownDescriptions = List.filled(25, "");
  final List tileAssignment = List.filled(25, "");
  var ranNum = new Random();
  int randList = 0;
  var c = 0;
  int cou = 0;
  var r = 0;
  bool? isLaura;
  bool? isOma;
  bool? isEdl;
  bool? isRoth;
  bool? isFuneral;
  bool? isBar;
  bool? isParty;
  String tmp = '';
  var y = 0;

  gameList(
    bool? isLaura,
    bool? isOma,
    bool? isEdl,
    bool? isRoth,
    bool? isFuneral,
    bool? isBar,
    bool? isParty,
  ) {
    this.isLaura = isLaura;
    this.isOma = isOma;
    this.isEdl = isEdl;
    this.isRoth = isRoth;
    this.isFuneral = isFuneral;
    this.isBar = isBar;
    this.isParty = isParty;

    if (isLaura == true) {
      randList = 1;
    }
    if (isOma == true) {
      randList = 2;
    }
    if (isEdl == true) {
      randList = 3;
    }
    if (isRoth == true) {
      randList = 4;
    }
    if (isFuneral == true) {
      randList = 5;
    }
    if (isBar == true) {
      randList = 6;
    }
    if (isParty == true) {
      randList = 7;
    }

    while (cou < 25) {
      if (isFuneral == true) {
        r = ranNum.nextInt(fList.length);
        tileAssignment[cou] = fList[r];
        shownDescriptions[cou] = fDescription[r];
        fList.removeAt(r);
        fDescription.removeAt(r);
        cou++;
      } else if (isBar == true) {
        r = ranNum.nextInt(bList.length);
        tileAssignment[cou] = bList[r];
        shownDescriptions[cou] = bDescription[r];
        bList.removeAt(r);
        bDescription.removeAt(r);
        cou++;
      } else if (isParty == true) {
        r = ranNum.nextInt(pList.length);
        tileAssignment[cou] = pList[r];
        shownDescriptions[cou] = pDescription[r];
        pList.removeAt(r);
        pDescription.removeAt(r);
        cou++;
      } else {
        c = ranNum.nextInt(randList + 1);
        if (c == 0) {
          r = ranNum.nextInt(uList.length);
          tileAssignment[cou] = uList[r];
          shownDescriptions[cou] = uDescription[r];
          uList.removeAt(r);
          uDescription.removeAt(r);
          cou++;
        } else if (c == 1 && isLaura == true) {
          r = ranNum.nextInt(lList.length);
          tileAssignment[cou] = lList[r];
          shownDescriptions[cou] = lDescription[r];
          lList.removeAt(r);
          lDescription.removeAt(r);
          cou++;
        } else if (c == 2 && isOma == true) {
          r = ranNum.nextInt(oList.length);
          tileAssignment[cou] = oList[r];
          shownDescriptions[cou] = oList[r];
          oList.removeAt(r);
          oDescription.removeAt(r);
          cou++;
        } else if (c == 3 && isEdl == true) {
          r = ranNum.nextInt(eList.length);
          tileAssignment[cou] = eList[r];
          shownDescriptions[cou] = eList[r];
          eList.removeAt(r);
          eDescription.removeAt(r);
          cou++;
        } else if (c == 4 && isRoth == true) {
          r = ranNum.nextInt(rList.length);
          tileAssignment[cou] = rList[r];
          shownDescriptions[cou] = rDescription[r];
          rDescription.removeAt(r);
          rList.removeAt(r);
          cou++;
        }
      }
    }
  }
}
