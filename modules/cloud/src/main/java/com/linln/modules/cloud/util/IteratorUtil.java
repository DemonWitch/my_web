package com.linln.modules.cloud.util;

import java.util.Objects;
import java.util.function.BiConsumer;

/**
 * @Author Richard Lv
 * @Date 2020/12/20 19:27
 * @Version 1.0
 * @Description
 */
public class IteratorUtil {
    public static <T> void forEach(Integer startIndex,
                                       Iterable<? extends T> elements, BiConsumer<Integer, ? super T> action) {
        Objects.requireNonNull(elements);
        Objects.requireNonNull(action);
        for (T element : elements) {
            action.accept(startIndex++, element);
        }
    }
}
