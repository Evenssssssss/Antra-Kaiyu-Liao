using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_1
{
    public class NumberSizeandRange_01
    {
        public static void Show_the_Type()
        {
            Console.WriteLine($"The number of bytes of sbyte in memory is {sizeof(sbyte)}");
            Console.WriteLine($"The maximum value of sbyte is {int.MaxValue}");
            Console.WriteLine($"The minimum value of sbyte is {int.MinValue}");
            Console.WriteLine($"The number of bytes of byte in memory is {sizeof(byte)}");
            Console.WriteLine($"The maximum value of byte is {byte.MaxValue}");
            Console.WriteLine($"The minimum value of byte is {byte.MinValue}");
            Console.WriteLine($"The number of bytes of short in memory is {sizeof(short)}");
            Console.WriteLine($"The maximum value of short is {short.MaxValue}");
            Console.WriteLine($"The minimum value of short is {short.MinValue}");
            Console.WriteLine($"The number of bytes of ushort in memory is {sizeof(ushort)}");
            Console.WriteLine($"The maximum value of ushort is {ushort.MaxValue}");
            Console.WriteLine($"The minimum value of ushort is {ushort.MinValue}");
            Console.WriteLine($"The number of bytes of int in memory is {sizeof(int)}");
            Console.WriteLine($"The maximum value of int is {int.MaxValue}");
            Console.WriteLine($"The minimum value of int is {int.MinValue}");
            Console.WriteLine($"The number of bytes of uint in memory is {sizeof(uint)}");
            Console.WriteLine($"The maximum value of uint is {uint.MaxValue}");
            Console.WriteLine($"The minimum value of uint is {uint.MinValue}");
            Console.WriteLine($"The number of bytes of long in memory is {sizeof(long)}");
            Console.WriteLine($"The maximum value of long is {long.MaxValue}");
            Console.WriteLine($"The minimum value of long is {long.MinValue}");
            Console.WriteLine($"The number of bytes of ulong in memory is {sizeof(ulong)}");
            Console.WriteLine($"The maximum value of ulong is {ulong.MaxValue}");
            Console.WriteLine($"The minimum value of ulong is {ulong.MinValue}");
            Console.WriteLine($"The number of bytes of float in memory is {sizeof(float)}");
            Console.WriteLine($"The maximum value of float is {float.MaxValue}");
            Console.WriteLine($"The minimum value of float is {float.MinValue}");
            Console.WriteLine($"The number of bytes of double in memory is {sizeof(double)}");
            Console.WriteLine($"The maximum value of double is {double.MaxValue}");
            Console.WriteLine($"The minimum value of double is {double.MinValue}");
            Console.WriteLine($"The number of bytes of decimal in memory is {sizeof(decimal)}");
            Console.WriteLine($"The maximum value of decimal is {decimal.MaxValue}");
            Console.WriteLine($"The minimum value of decimal is {decimal.MinValue}");
        }

        public static void CenturiesConvert(byte centuries)
        {
            ushort year = Convert.ToUInt16(centuries * 100);
            uint day = Convert.ToUInt32(year * 365 + year / 4);
            uint hour = day * 24;
            ulong minute = hour * 60;
            ulong second = Convert.ToUInt64(minute * 60);
            ulong milliesecond = second * 1000;
            ulong microsecond = milliesecond * 1000;
            string nanosecond = Convert.ToString(microsecond * 1000);
            Console.WriteLine($"{centuries} Centuries = {year} Years = {day} Days = {hour} Hours = {minute} Minutes = {second} Seconds = {milliesecond} Milliesconds = {microsecond} Micorsecond = {nanosecond} Nanosecond");
        }
    }
    /*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
    class PlayingwithConsole

    {
        public static void InputandOut()
        {

            Console.WriteLine("What is your Name:");
            string name = Console.ReadLine();
            Console.WriteLine("How old are you:");
            int age = Convert.ToByte(Console.ReadLine());
            Console.WriteLine($"Hi,{name}. I can not believe your age already {age}");
            Console.WriteLine("Might I ask about your Salary?");
            uint salary = Convert.ToUInt32(Console.ReadLine());
            Console.WriteLine("Do you think how many employee does your compay has?");
            uint employee = Convert.ToUInt16(Console.ReadLine());
            Console.WriteLine($"So. your company has {employee} employy, and your salary is {salary}");
            Console.WriteLine("What is your astrology sign?");
            string sign = Console.ReadLine();
            Console.WriteLine("What is your favorite color?");
            string color = Console.ReadLine();
            Console.WriteLine($"Oh, your are {sign}, and you like {color}");
        }
    }

    /*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
    public static class Practiceoloopandoperators
    {
        public static void FizzBuzzis()
        {
            for (int i = 1; i < 100; ++i)
            {
                if (i % 15 == 0) Console.WriteLine("fizzbuzz");
                else if (i % 5 == 0) Console.WriteLine("buzz");
                else if (i % 3 == 0) Console.WriteLine("fizz");
                else Console.WriteLine(i);
            }
        }

        public static void infinityloop()
        {
            int max = 500;
            for (byte i = 0; i < max; i++)
            {
                if (i.GetType() != max.GetType()) throw (new ApplicationException("The type of variable of initial value in for loop and the type of variable of Max is not the same type "));
                Console.WriteLine(i);
            }
        }

        public static void Guessgame()
        {
            int correctNumber = new Random().Next(3) + 1;
            Console.WriteLine("Please Enter you guess:");
            int guessNumber;
            guessNumber = Convert.ToInt32(Console.ReadLine());
            if (guessNumber == correctNumber) Console.WriteLine("It's correct answer");
            else if (guessNumber < correctNumber && guessNumber >= 1) Console.WriteLine("It too low");
            else if (guessNumber > correctNumber && guessNumber <= 3) Console.WriteLine("It too high");
            else Console.WriteLine("your guess out range");
        }

        public static void star(int level)
        {
            for (int i = 1; i <= level; ++i)
            {
                for (int j = level - i; j >= 0; --j) Console.Write(" ");
                for (int k = (i - 1) * 2; k > 0; --k) Console.Write("*");
                Console.WriteLine("*");
            }
        }

        public static void Calculatesday()
        {
            Console.WriteLine("Enter your birthday:");
            DateTime birthday = Convert.ToDateTime(Console.ReadLine());
            double days = (DateTime.Today - birthday).TotalDays;
            Console.WriteLine(days);
            Console.WriteLine($"Days to next Anniversary is {10000 - (days % 10000)}");
        }

        public static void Appropriategreeting()
        {
            int hour = DateTime.Now.Hour;
            if (hour < 12 && hour > 8) Console.WriteLine("Good Morning");
            if (hour < 18 && hour >= 12) Console.WriteLine("Good Afternoon");
            if (hour < 20 && hour >= 18) Console.WriteLine("Good Evening");
            if ((hour <= 24 && hour >= 20) || hour <= 8) Console.WriteLine("Good Night");
            Console.WriteLine(hour);
        }

        public static void Fourloop()
        {
            for (int i = 1; i < 5; i++)
            {
                for (int j = 0; j < 24; j = j + i)
                {
                    Console.Write($"{j},");
                }
                Console.WriteLine(24);
            }
        }

    }


}