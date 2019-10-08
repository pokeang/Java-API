package StreamTest;

import java.util.Arrays;
import java.util.List;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import org.junit.Test;


public class PartitionList {
	
	
	@Test
	public void steamPartition(){
		List<Integer> list = Arrays.asList(1,4,3);
        list.forEach(i -> {
        	System.out.println(i);
        });
	}
	
	@Test
	public void givenList_whenParitioningIntoNSublists_thenCorrect() {
		List<String> myList =
			    Arrays.asList("a1", "a2", "b1", "c2", "c1");

			myList
			    .stream()
			    .forEach(System.out::println);
	}
}
