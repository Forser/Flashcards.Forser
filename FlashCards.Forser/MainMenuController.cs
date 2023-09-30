﻿namespace FlashCards.Forser
{
    internal class MainMenuController
    {
        internal void MainMenu()
        {
            bool closeApp = false;

            while (closeApp == false)
            {
                StackController stackController = new StackController();
                StudyRecordsController studyRecordsController = new StudyRecordsController();
                StudyController studyController = new StudyController();

                Console.Clear();
                Console.WriteLine("------------------------------------------");
                Console.WriteLine("              MAIN MENU");
                Console.WriteLine("Study - Study a Stack");
                Console.WriteLine("Stack - Go to Stack Menu");
                Console.WriteLine("Records - View Study Records\n");
                Console.WriteLine("Exit - Exit Application");
                Console.WriteLine("------------------------------------------");

                string selectedMenu = Console.ReadLine().Trim().ToLower();

                switch (selectedMenu)
                {
                    case "study":
                        studyController.ShowStudyMenu();
                        break;
                    case "records":
                        studyRecordsController.ShowRecordsMenu();
                        break;
                    case "stack":
                        stackController.ShowStackMenu();
                        break;
                    case "exit":
                        closeApp = true;
                        Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine("Not a valid option, select from an option from the Menu");
                        break;
                }
            }
        }
    }
}