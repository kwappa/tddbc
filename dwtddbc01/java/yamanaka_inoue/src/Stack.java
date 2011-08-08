import java.util.EmptyStackException;


public class Stack {

	private int[] array = new int[16];
	int size = 0;


	public boolean isEmpty() {
		if(size > 0) {
			return false;
		}
		else {
			return true;
		}
	}

	public int size () {
		return size;
	}

	public void push(int i) throws StackOverflowError {
		if(size>=maxSize()){
			int[] old_array = array;
			array = new int[maxSize()+16];
			System.arraycopy(old_array, 0, array, 0, old_array.length);
		}
		// TODO 自動生成されたメソッド・スタブ
		array[size] = i;
		size++;
	}

	public void pop() throws EmptyStackException {
		// TODO 自動生成されたメソッド・スタブ
		if(size == 0) {
			throw new EmptyStackException();
		}
		size--;
	}

	public boolean search(int i, int depth) {
		int depth2 = size-depth;
		if(depth2 < 0) {
			depth2 = 0;
		}
		for(int j=size-1; j >= depth2; j--) {
			if(array[j] == i) {
				return true;
			}
		}

		return false;
	}

	public

	public int top() {
		// TODO 自動生成されたメソッド・スタブ

		return array[size-1];
	}

	public int maxSize() {
		return array.length;
	}
}
