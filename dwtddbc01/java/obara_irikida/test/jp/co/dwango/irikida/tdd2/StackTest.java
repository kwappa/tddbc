package jp.co.dwango.irikida.tdd2;
import junit.framework.TestCase;
import static org.hamcrest.Matchers.*;
import org.junit.Test;
import static org.junit.Assert.*;
import java.lang.StackOverflowError;

public class StackTest extends TestCase{
	@Test
	public void testisEmpty‚ÌƒeƒXƒg() throws Exception {
		Stack stack = new Stack();
		assertTrue(stack.isEmpty());
		
		stack.push(5);
		assertFalse(stack.isEmpty());
		stack.pop();
		assertTrue(stack.isEmpty());
		stack.push(0);
		assertFalse(stack.isEmpty());
	}
	
	public void testSize()
	{
		Stack stack = new Stack();
		assertThat(stack.size(),is(0));
		stack.push(5);
		assertThat(stack.size(),is(1));
		stack.push(0);
		assertThat(stack.size(),is(2));

		assertThat(stack.top(),is(0));
		assertThat(stack.top(),is(0));
		stack.pop();
		assertThat(stack.top(),is(5));		
	}

	public void testPush()
	{
		Stack stack = new Stack();
		try
		{
			for(int i=0; i<100; i++)
			{
				stack.push(1);
			}
		}
		catch(StackOverflowError ex)
		{
			return;
		}
		assertTrue(false);	
	}
	public void test16ŒÂpush‚µ‚½() {
		Stack stack = new Stack();
		try {
			for(int i=0; i<16; i++) {
				stack.push(i);
			}
		} catch(StackOverflowError ex)
		{
			// failure
			assertTrue(false);	
		}
		assertTrue(true);	
	}
	public void test17ŒÂpush‚µ‚½() {
		Stack stack = new Stack();
		try {
			for(int i=0; i<17; i++) {
				stack.push(i);
			}
		} catch(StackOverflowError ex)
		{
			assertTrue(true);	
			return;
		}
		// failure
		assertTrue(false);	
	}
	
	public void testPop()
	{
		Stack stack = new Stack();
		try
		{
			stack.pop();
		}
		catch(Exception ex)
		{
			return;
		}
		assertTrue(false);
	}
	
	public void testMaxSize() {
		Stack stack = new Stack();
		assertThat(stack.maxSize(),is(16));
	}
}
