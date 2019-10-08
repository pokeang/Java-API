package com.mcnc.students.controller;

import java.util.Spliterator;
import java.util.Spliterators;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class StreamTest {
	static <T> Spliterator<T> takeWhile(Spliterator<T> splitr, Predicate<? super T> predicate) {
		return new Spliterators.AbstractSpliterator<T>(splitr.estimateSize(), 0) {
			boolean stillGoing = true;

			@Override
			public boolean tryAdvance(Consumer<? super T> consumer) {
				if (stillGoing) {
					boolean hadNext = splitr.tryAdvance(elem -> {
						if (predicate.test(elem)) {
							consumer.accept(elem);
						} else {
							stillGoing = false;
						}
					});
					return hadNext && stillGoing;
				}
				return false;
			}
		};
	}

	static <T> Stream<T> takeWhile(Stream<T> stream, Predicate<? super T> predicate) {
		return StreamSupport.stream(takeWhile(stream.spliterator(), predicate), false);
	}

	public static void main(String[] args) {
		Stream<Integer> lists = Stream.of(1,2,3,4,5);
		System.out.println(takeWhile(lists, null));
		/*IntStream
	    .iterate(1, n -> n + 1)
	    .takeWhile(lists, null)
	    .forEach(System.out::println);*/
	}

}
