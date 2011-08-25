package jp.co.dwango.irikida.tdd2;
import java.util.EmptyStackException;
import java.lang.StackOverflowError;
public class Stack {
	final int STACK_LIMIT = 16;
	private int[] m_list;
	private int m_length;
	private int temp;

	public Stack()
	{
		m_list = new int[STACK_LIMIT];
		m_length = 0;
	}

	public boolean isEmpty() {
		if( m_length == 0 ) return true;
		return false;
	}

	public void push(int i) throws StackOverflowError{
		if(m_length >= STACK_LIMIT) {
			throw new StackOverflowError();
		}
		temp = i;
		m_list[ m_length ] = i;
		m_length++;
	}

	public void pop() throws EmptyStackException{
		temp = 0;
		if(m_length > 0){
			m_length--;
		} else {
			throw new EmptyStackException();
		}
	}
	
	public int size() {
		return m_length;
	}
	
	public int top() {
		return m_list[ m_length > 0 ? m_length -1 : 0 ];
	}
	
	public int maxSize() {
		return STACK_LIMIT;
	}
}
