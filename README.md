# BlockAI

BlockAI : Processing 3.5.4 : Java

This was my first exploration into AI and Machine Learning, and my first project using Processing. In my work on my current other AI projects, I can look back even these few weeks and think of better ways I could’ve done things in this project, but this project was more of an experiment. I may revisit and perfect this AI in the future with regards to efficiency and speed, but for now I will continue work on other projects. I had a lot of fun on this project exploring AI and it made me want to make Snake and MinesweeperAI. 

As for the code:
It uses 2 classes (Player and BlockAI). The BlockAI class is the main class and it deals with events, while the Player class deals with the player objects and the AI attached to the player. The 2 classes make up 1000+ lines of code, and in retrospect if I were to do it again, I would’ve divided the Player class into two classes; one for the Player and one for its decision making (AI). 

The player has 4 flavors of how it traverses to find the goal, but the AI comes in when the player is about to hit a wall. When a player hits the wall, it will spawn another player meaning there will be 2. The two will traverse opposite sides the obstacle using my flushTraverse algorithm, and then later revert to the same pattern it was using before the AI came in to play. The players that use AI are referred to as the “ghosts” (they are green).
The red dot that follows after is how machine learning is incorporated. The ghosts race to the finish, and because there are so many of them and there are different variations, one will be perfect and make it before the others. That one will be the one that the red dot learns from. It’s like golf, where the red dot will choose to learn from the ghost with the lowest score. 

I decided to get into AI out of boredom at work while watching @codebullet . I am close to finishing both SnakeAI and MinesweeperAI, so expect another post in the coming weeks.

Lines of Code: ~1000
Hours spent: ~50

Please reach out to me if you have any questions!
