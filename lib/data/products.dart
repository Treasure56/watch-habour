String productsData = '''
[
  {
    "title": "Rolex Submariner Date 41mm",
    "brand": "Rolex",
    "description": "Iconic luxury diving watch with 41mm Oystersteel case, Cerachrom bezel, and automatic movement. Water-resistant to 300m with chronometer certification. A timeless symbol of prestige.",
    "categoryId": 4,
    "price": 9995.00,
    "stock": 8,
    "image": "https://www.prestigetime.com/preowned/images/watches/2022/02/102286/Rolex_126610LN_57195-(1).jpg"
  },
  {
    "title": "Samsung Galaxy Watch 6 Classic",
    "brand": "Samsung",
    "description": "Advanced smartwatch with rotating bezel, 1.5\\" AMOLED display, LTE connectivity, and body composition analysis. Runs Wear OS with 40-hour battery life.",
    "categoryId": 3,
    "price": 399.99,
    "stock": 23,
    "image": "https://gadgetflix.com.ng/wp-content/uploads/2023/08/654753-Product-0-I-638236874403905314_2383534b-5352-4522-8235-6c2206562032.jpg"
  },
  {
    "title": "Casio G-Shock DW-5600E-1V",
    "brand": "Casio",
    "description": "Rugged digital watch with shock resistance, 200m water resistance, multi-function alarm, and stopwatch. Features EL backlight and 10-year battery.",
    "categoryId": 2,
    "price": 89.95,
    "stock": 47,
    "image": "https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/D/DW/DW5/dw-5600bce-1/assets/DW-5600BCE-1.png.transform/color-variation/image.png"
  },
  {
    "title": "Omega Speedmaster Moonwatch",
    "brand": "Omega",
    "description": "Legendary mechanical chronograph with manual-winding movement, hesalite crystal, and tachymeter scale. NASA-certified for space missions.",
    "categoryId": 6,
    "price": 6250.00,
    "stock": 12,
    "image": "https://monochrome-watches.com/wp-content/uploads/2021/01/Omega-Speedmaster-Moonwatch-Professional-Master-Chronometer-Co-Axial-2021-review-12.jpg"
  },
  {
    "title": "Garmin Fenix 7X Sapphire Solar",
    "brand": "Garmin",
    "description": "Premium multisport GPS watch with solar charging, 1.4\\" sunlight-visible display, and advanced training metrics. Features topographic maps and 37-day battery.",
    "categoryId": 5,
    "price": 899.99,
    "stock": 18,
    "image": "https://www.garmin.com.sg/m/sg/g/products/fenix-7x-sapphire-solar-whitestone-cf-lg.jpg"
  },
  {
    "title": "Seiko Presage Cocktail Time",
    "brand": "Seiko",
    "description": "Elegant analog watch with 40.5mm stainless steel case, automatic movement, and sunburst dial. Features 41-hour power reserve and exhibition case back.",
    "categoryId": 1,
    "price": 475.00,
    "stock": 32,
    "image": "https://www.seikoboutique.co.uk/wp-content/uploads/2022/05/SRPJ13J1_det-800x800.jpg"
  },
  {
    "title": "Apple Watch Ultra 2",
    "brand": "Apple",
    "description": "Premium smartwatch with titanium case, dual-frequency GPS, depth gauge, and Action button. Features 36-hour battery and always-on Retina display.",
    "categoryId": 3,
    "price": 799.00,
    "stock": 27,
    "image": "https://www.istore.com.ng/cdn/shop/files/Apple_Watch_Ultra_2_LTE_49mm_Titanium_Orange_Ocean_Band_PDP_Image_Position-1__WWEN_1200x.jpg?v=1696633051"
  },
  {
    "title": "Tag Heuer Carrera Chronograph",
    "brand": "Tag Heuer",
    "description": "Swiss-made chronograph with 44mm steel case, automatic movement, and tachymeter scale. Features 80-hour power reserve and sapphire crystal.",
    "categoryId": 7,
    "price": 4850.00,
    "stock": 6,
    "image": "https://www.tagheuer.com/on/demandware.static/-/Library-Sites-TagHeuer-Shared/default/dw3ee33dd8/images/collections/carrera/chronograph-39mm/TH-revamp-chronograph-39mm-usp3-2.jpg"
  },
  {
    "title": "Citizen Promaster Marine Eco-Drive",
    "brand": "Citizen",
    "description": "Solar-powered diving watch with 44mm titanium case, 200m water resistance, and unidirectional bezel. Perpetual calendar and power reserve indicator.",
    "categoryId": 8,
    "price": 395.00,
    "stock": 41,
    "image": "https://cdn.webshopapp.com/shops/296139/files/414921392/citizen-promaster-bn2038-01l-marine-sea.jpg"
  },
  {
    "title": "Timex Expedition Grid Shock",
    "brand": "Timex",
    "description": "Durable digital watch with INDIGLO backlight, 100m water resistance, and 24-hour chronograph. Shock-resistant construction with resin strap.",
    "categoryId": 2,
    "price": 49.95,
    "stock": 56,
    "image": "https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9pbWFnZXMtY2RuLnVidXkuY28uaW4vNjUzYTgxNWJlNDRkOWE0ZDI0M2Y1OTU5LXRpbWV4LW1lbi0zOS1zLXR3NGIwMjUwMC1leHBlZGl0aW9uLmpwZw.jpg"
  },
  {
    "title": "Patek Philippe Calatrava",
    "brand": "Patek Philippe",
    "description": "Ultra-thin mechanical dress watch with 39mm white gold case, hand-engraved dial, and sapphire case back. Swiss-made perpetual movement.",
    "categoryId": 4,
    "price": 29999.00,
    "stock": 3,
    "image": "https://www.analogshift.com/cdn/shop/files/AS09993_40930489_PATEKPHILIPPE_CALATRAVARG_5227R-6.jpg?v=1730508534&width=1500"
  },
  {
    "title": "Suunto 9 Baro Titanium",
    "brand": "Suunto",
    "description": "GPS sports watch with barometric sensor, 120h battery life, and over 80 sport modes. Features weather tracking and recovery insights.",
    "categoryId": 5,
    "price": 649.00,
    "stock": 14,
    "image": "https://www.suunto.com/globalassets/productimages/suunto-9/baro-charcoal-black-titanium/zh-screens/ss050586000-suunto-9-baro-charcoal-black-titanium-front-intensity-zones-chinese-01.png?height=900&format=jpg"
  },
  {
    "title": "Orient Bambino Version 8",
    "brand": "Orient",
    "description": "Classic automatic watch with domed mineral crystal, 40.5mm stainless steel case, and date display. Features 40-hour power reserve.",
    "categoryId": 1,
    "price": 220.00,
    "stock": 38,
    "image": "https://m.media-amazon.com/images/I/71pWkLyiASL._AC_SL1500_.jpg"
  },
  {
    "title": "Breitling Navitimer B01 Chronograph",
    "brand": "Breitling",
    "description": "Aviation chronograph with slide rule bezel, 43mm steel case, and COSC-certified automatic movement. Features 70-hour power reserve.",
    "categoryId": 7,
    "price": 8950.00,
    "stock": 7,
    "image": "https://www.luxurytimeglobal.com/cdn/shop/files/23704145-tki1q39cmvukvjlwfos7u2uh-ExtraLarge.jpg?v=1718748513"
  },
  {
    "title": "Casio Pro Trek PRW-3500",
    "brand": "Casio",
    "description": "Solar-powered digital watch with triple sensor (altimeter/barometer/compass), 200m water resistance, and atomic timekeeping.",
    "categoryId": 8,
    "price": 299.00,
    "stock": 22,
    "image": "https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/P/PR/PRW/PRW-3500-1/assets/PRW-3500-1_04.jpg.transform/main-visual-sp/image.jpg"
  },
  {
    "title": "Tissot Le Locle Powermatic 80",
    "brand": "Tissot",
    "description": "Swiss-made mechanical watch with 39mm stainless steel case, automatic movement, and 80-hour power reserve. Features guilloché dial.",
    "categoryId": 6,
    "price": 675.00,
    "stock": 19,
    "image": "https://lh4.googleusercontent.com/proxy/GeC7SPheXOWck0zACLvU8wj2KMnZpxZkJB7W8yLxDfXlJKCgfVpE1o24o6qRQ3rZLrog_M6Buc07HnDM06U8X8wO2X9PhccBUrUGeJ3U0NYuMeR1U3D4Hb-Mz5cVHvNF"
  },
  {
    "title": "Fossil Neutra Chronograph",
    "brand": "Fossil",
    "description": "Retro-style analog chronograph with 44mm stainless steel case, tachymeter scale, and exhibition case back. Japanese quartz movement.",
    "categoryId": 7,
    "price": 195.00,
    "stock": 45,
    "image": "https://m.media-amazon.com/images/I/41n-scHTUTL._AC_QL92_SH45_UL240_SR240,220_.jpg"
  },
  {
    "title": "Garmin Venu 3S",
    "brand": "Garmin",
    "description": "Health-focused smartwatch with AMOLED display, sleep coaching, and built-in microphone. Features 10-day battery life and animated workouts.",
    "categoryId": 3,
    "price": 449.99,
    "stock": 31,
    "image": "https://res.garmin.com/en/products/010-02784-01/v/cf-lg.jpg"
  },
  {
    "title": "Seiko Prospex SRPE93",
    "brand": "Seiko",
    "description": "Professional diving watch with 42.5mm stainless steel case, 200m water resistance, and Lumibrite markers. Automatic movement with 41-hour reserve.",
    "categoryId": 8,
    "price": 525.00,
    "stock": 16,
    "image": "https://d2j6dbq0eux0bg.cloudfront.net/images/16115183/4072014064.jpg"
  },
  {
    "title": "Hamilton Khaki Field Mechanical",
    "brand": "Hamilton",
    "description": "Military-inspired mechanical watch with 38mm stainless steel case, hand-wound movement, and NATO strap. Features 80-hour power reserve.",
    "categoryId": 6,
    "price": 595.00,
    "stock": 24,
    "image": "https://oracleoftime.com/wp-content/uploads/2024/06/Hamilton-Khaki-Field-Mechanical-H69439910.jpg"
  }
]

''';
