using System.Collections;

internal class Program
{
    private static void Main(string[] args)
    {
        foreach (int prime in GetPrimes())
        {
            Console.WriteLine(prime);
            Thread.Sleep(1000);
        }
    }

    public static IEnumerable<int> GetPrimes()
    {
        int currPrime = 1;
        while (true)
        {
            currPrime++;
            if (IsPrimeNumber(currPrime))
            {
                yield return currPrime;
            }
        }
    }

    private static bool IsPrimeNumber(int value)
    {
        if (value != 2 && value % 2 == 0)
        {
            return false;
        }

        for (int i = 2; i < value / 2; i++)
        {
            if (value % i == 0)
            {
                return false;
            }
        }

        return true;
    }
}