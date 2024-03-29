players(genshin_impact, 2).
players(red_dead_redemption_2, 1).
players(red_dead_redemption, 0).
players(legend_of_zelda_botw, 0).
players(league_of_legends, 2).
players(halo_5, 1).
players(spider_man_2, 0).
players(god_of_war, 0).
players(clash_royale, 3).
players(portal, 0).
players(starfield, 0).
players(elden_ring, 1).
players(hearthstone, 2).
players(world_of_warcraft, 3).
players(dota_2, 2).
players(starcraft_2, 1).
players(cs2, 1).
players(dead_space, 0).
players(destiny_2, 2).
players(baldurs_gate_3, 1).

platforms(genshin_impact, 10).
platforms(red_dead_redemption_2, 9).
platforms(red_dead_redemption, 5).
platforms(legend_of_zelda_botw, 4).
platforms(league_of_legends, 8).
platforms(halo_5, 3).
platforms(spider_man_2, 2).
platforms(god_of_war, 6).
platforms(clash_royale, 0).
platforms(portal, 1).
platforms(starfield, 7).
platforms(elden_ring, 9).
platforms(hearthstone, 8).
platforms(world_of_warcraft, 1).
platforms(dota_2, 1).
platforms(starcraft_2, 1).
platforms(cs2, 1).
platforms(dead_space, 9).
platforms(destiny_2, 9).
platforms(baldurs_gate_3, 9).

genre(genshin_impact, 6).
genre(red_dead_redemption_2, 6).
genre(red_dead_redemption, 6).
genre(legend_of_zelda_botw, 6).
genre(league_of_legends, 0).
genre(halo_5, 8).
genre(spider_man_2, 6).
genre(god_of_war, 7).
genre(clash_royale, 3).
genre(portal, 2).
genre(starfield, 6).
genre(elden_ring, 1).
genre(hearthstone, 4).
genre(world_of_warcraft, 5).
genre(dota_2, 0).
genre(starcraft_2, 3).
genre(cs2, 8).
genre(dead_space, 9).
genre(destiny_2, 10).
genre(baldurs_gate_3, 11).



question1(X1):-	write("Is your game multiplayer?"),nl,
		write("  3.   It's multiplayer only"),nl,
		write("  2.   It requires connection, but can be played solo"),nl,
		write("  1.   It has multiplayer, but can be played offline"),nl,
		write("  0.   No, it's fully singleplayer"),nl,
		read(X1).

question2(X2):-	write("What are the supported platforms for your game?"),nl,
                write("  10. XBOX & PC & PS & Mobile"),nl,
                write("  9.   XBOX & PC & PS"),nl,
                write("  8.   PC & Mobile"),nl,
		write("  7.   XBOX & PC"),nl,
		write("  6.   PS & PC"),nl,
		write("  5.   XBOX & PS"),nl,
		write("  4.   Nintendo Switch only"),nl,
                write("  3.   XBOX only"),nl,
                write("  2.   PS only"),nl,
		write("  1.   PC only"),nl,
		write("  0.   Mobile only"),nl,
		read(X2).

question3(X3):-	write("Main genre of your game?"),nl,
		write("  11. Turn-based strategy"),nl,
		write("  10. Looter-shooter"),nl,
		write("  9.   Horror"),nl,
		write("  8.   Shooter"),nl,
		write("  7.   Hack & Slash"),nl,
		write("  6.   Action-Adventure"),nl,
		write("  5.   Massively Multiplayer Online"),nl,
                write("  4.   Collectible Card Game"),nl,
		write("  3.   Real Time Strategy"),nl,
		write("  2.   Puzzle"),nl,
		write("  1.   Soulslike"),nl,
                write("  0.   Multiplayer Online Battle Arena"),nl,
		read(X3).
  
pr:-	question1(X1), question2(X2), question3(X3), players(X,X1), platforms(X,X2), genre(X,X3),
        write("My suggestion based on your answers is "), write(X).


