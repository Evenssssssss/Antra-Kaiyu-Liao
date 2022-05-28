namespace Assignment4
{
    public class MyStack<T>
    {
        private int count;
        private T[] stack;

        public MyStack()
        {
            count = 0;
            stack = null;
        }

        public int Count() { return count; }

        public T Pop()
        {
            T return_val = stack[--count]; // Count should decrement before anything else happens
            T[] temp_stack = new T[count];
            for (int i = 0; i < count; i++) { temp_stack[i] = stack[i]; }
            stack = temp_stack;
            return return_val;
        }

        public void Push(T new_val)
        {
            if (stack == null)
            {
                stack = new T[1] { new_val };
                count = 1;
            }
            else
            {
                T[] temp_stack = new T[++count]; // Count should increment before anything else happens
                for (int i = 0; i < count - 1; i++) { temp_stack[i] = stack[i]; }
                temp_stack[count - 1] = new_val;
                stack = temp_stack;
            }
        }
    }
    /*-------------------------------------------------------------------------------------------------------------------------*/
    public class List<T>
    {
        private int count;
        private T[] stack;

        public List()
        {
            count = 0;
            stack = null;
        }

        public void Add(T element)
        {
            if (stack == null)
            {
                stack = new T[1] { element };
                count = 1;
            }
            else
            {
                T[] temp_stack = new T[++count]; // Count should increment before anything else happens
                for (int i = 0; i < count - 1; i++) { temp_stack[i] = stack[i]; }
                temp_stack[count - 1] = element;
                stack = temp_stack;
            }
        }

        public void Remove(int index)
        {
            if (index >= count || index < 0) { Console.WriteLine("Provided index out of range. Aborting..."); }
            else
            {
                T[] temp_stack = new T[--count]; // Count should decrement before anything else happens
                for (int i = 0; i < index; i++) { temp_stack[i] = stack[i]; }
                for (int i = index + 1; i < count; i++) { temp_stack[i] = stack[i]; }
                stack = temp_stack;
            }
        }

        public bool Contains(T element)
        {
            foreach (var i in stack)
            {
                if (i.Equals(element)) { return true; }
            }
            return false;
        }

        public void Clear() { stack = null; }

        public void InsertAt(T element, int index)
        {
            if (index >= count || index < 0) { Console.WriteLine("Provided index out of range. Aborting..."); }
            else
            {
                T[] temp_stack = new T[++count]; // Count should increment before anything else happens
                for (int i = 0; i < index; i++) { temp_stack[i] = stack[i]; }
                temp_stack[index] = element; 0
                for (int i = index + 1; i < count; i++) { temp_stack[i] = stack[i]; }
                stack = temp_stack;
            }
        }

        public void DeleteAt(int index)
        {
            if (index >= count || index < 0) { Console.WriteLine("Provided index out of range. Aborting..."); }
            else
            {
                T[] temp_stack = new T[--count]; // Count should decrement before anything else happens
                for (int i = 0; i < index; i++) { temp_stack[i] = stack[i]; }
                for (int i = index + 1; i < count; i++) { temp_stack[i] = stack[i]; }
                stack = temp_stack;
            }
        }

        public T Find(int index) { return stack[index]; }
    }
}