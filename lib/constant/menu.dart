const List<String> menuList = ["Home", "About", "Contact"];
//menuList as array of object containing title,route, icon, color

const List<Map<String, dynamic>> menuList2 = [
  {"title": "Home", "route": "/", "icon": "home", "color": "red"},
  {"title": "Contact", "route": "/contact", "icon": "home", "color": "red"},
  {
    "title": "Gestion des etudes",
    "route": "/contact",
    "icon": "home",
    "color": "red",
    "children": [
      {"title": "Contact", "route": "/contact", "icon": "home", "color": "red"},
    ]
  },
  {
    "title": "Gestion des participations",
    "route": "/participations",
    "icon": "home",
    "color": "red",
    "children": [
      {"title": "Amodiations", "route": "/amodiation", "icon": "home", "color": "red"},
      {"title": "Join Venture", "route": "/jv", "icon": "home", "color": "red"},
      {"title": "Filiale", "route": "/filiale", "icon": "home", "color": "red"},
    ]
  },
];
