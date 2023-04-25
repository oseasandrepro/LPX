using System.Collections;

internal class Program
{
    private static void Main(string[] args)
    {
        PrimeIterator primeNumbers = new PrimeIterator();

       foreach (int prime in primeNumbers)
       {
           Console.WriteLine(prime);
            Thread.Sleep(1000);
       }
    }

}

public class PrimeIterator : IEnumerable
{
    public IEnumerator GetEnumerator()
    {
        return new PrimeEnumerator();
    }

}

public class PrimeEnumerator : IEnumerator
{
    private int currPrime = 1;
    public object Current
    {
        get { return currPrime; }
    }

    public bool MoveNext()
    {
        while (true)
        {
            currPrime++;
            if (isPrimeNumber(currPrime)){
               break;
            }
        }

        return true;
    }

    public void Reset()
    {
        throw new NotSupportedException();
    }

    private static bool isPrimeNumber(int value)
    {
        if (value != 2 && value % 2 == 0)
            return false;

        for (int i = 2; i < value / 2; i++)
        {
            if (value % i == 0){
                return false;
            }
        }

        return true;
    }
}