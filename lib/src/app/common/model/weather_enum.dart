enum WeatherState {
  clearSky(800),
  fewClouds(801),
  scatteredClouds(802),
  brokenClouds(803),
  overcastClouds(804),
  lightRain(500),
  moderateRain(501),
  heavyIntensityRain(502),
  veryHeavyRain(503),
  extremeRain(504),
  freezingRain(511),
  lightIntensityRain(520),
  showerRain(521),
  heavyIntensityShowerRain(522),
  raggedShowerRain(531),
  thunderstormWithLightRain(200),
  thunderstormWithRain(201),
  thunderstormWithHeavyRain(202),
  lightThunderstorm(210),
  thunderstorm(211),
  heavyThunderstorm(212),
  raggedThunderstorm(221),
  thunderstormWithLightDrizzle(230),
  thunderstormWithDrizzle(231),
  thunderstormWithHeavyDrizzle(232),
  lightShowerSnow(620),
  lightSnow(600),
  snow(601),
  heavySnow(602),
  sleet(611),
  lightShowerSleet(612),
  showerSleet(613),
  lightRainAndSnow(615),
  rainAndSnow(616),
  showerSnow(620),
  heavyShowerSnow(622),
  mist(701),
  fog(741),
  lightIntensityDrizzle(300),
  drizzle(301),
  heavyIntensityDrizzle(302),
  lightIntensityDrizzleRain(310),
  lightIntensityShowerRain(520),
  drizzleRain(311),
  heavyIntensityDrizzleRain(312),
  showerRainAndDrizzle(313),
  heavyShowerRainAndDrizzle(314),
  showerDrizzle(321),
  smoke(711),
  haze(721),
  dustSand(731),
  sand(751),
  dust(761),
  squall(771),
  tornado(781);

  const WeatherState(this.weatherState);

  final int weatherState;
}
