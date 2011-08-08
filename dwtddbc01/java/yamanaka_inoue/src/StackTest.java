import static org.junit.Assert.*;

import java.util.EmptyStackException;


import org.junit.Test;



public class StackTest {
	@Test
	public void isEmptyのテスト() throws Exception {
		Stack stack = new Stack();
		assertTrue(stack.isEmpty());
		stack.push(5);
		assertFalse(stack.isEmpty());
	}

//	@Test(expected = StackOverflowError.class)
	@Test
	public void pushのテスト() throws Exception {
		Stack stack = new Stack();
		for (int i=0;i<16;i++) {
			assertSame(stack.size(), i);
			stack.push(i);
			assertSame(stack.top(), i);
		}
		assertSame(stack.size(), 16);

		stack.push(0);
		assertSame(stack.size(), 17);
		assertSame(stack.maxSize(), 32);

		for (int i=17;i<33;i++) {
			assertSame(stack.size(), i);
			stack.push(i);
			assertSame(stack.top(), i);
		}

		assertSame(stack.size(), 33);
		assertSame(stack.maxSize(), 48);
	}

	@Test(expected = EmptyStackException.class)
	public void popのテスト() throws Exception {
		Stack stack = new Stack();

		for (int i=0;i<16;i++) {
			stack.push(i);
			//assertSame(stack.top(), i);
		}

		for (int i=0;i<16;i++) {
			stack.pop();
		}

		stack.pop();
	}
	@Test
	public void maxSizeのテスト() throws Exception {
		Stack stack = new Stack();
		assertSame(stack.maxSize(), 16);
	}

	@Test
	public void searchのテスト() throws Exception {
		Stack stack = new Stack();
		assertFalse(stack.search(10, 10));
		for (int i=0;i<16;i++) {
			stack.push(i);
		}
		assertTrue(stack.search(6, 10));
		assertFalse(stack.search(5, 10));
	}

}
