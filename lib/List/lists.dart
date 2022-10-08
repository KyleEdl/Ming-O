import 'dart:ffi';
import 'dart:math';
import 'package:bingo_application/main.dart';
import 'package:flutter/material.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'package:bingo_application/screens/bingoWin.dart';
import 'package:bingo_application/modelclass.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'package:bingo_application/service_locator.dart';

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
    'NPC mentions requirement',
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
    'NPC mentions requirement',
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
  String tmp = '';
  var y = 0;

  gameList(bool? isLaura, bool? isOma, bool? isEdl, bool? isRoth) {
    this.isLaura = isLaura;
    this.isOma = isOma;
    this.isEdl = isEdl;
    this.isRoth = isRoth;

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

    while (cou < 25) {
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
    print("Output from gameList: $tileAssignment");
    print("GameList Output for shownLongLists: $shownDescriptions");
  }
}
