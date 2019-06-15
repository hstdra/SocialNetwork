package Model;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.internal.Primitives;

import java.lang.reflect.Type;

public class GSON {
    private static final Gson gson = new Gson();

    public static String toJson(Object object){
        return gson.toJson(object);
    }

    public static <T> T fromJson(String json, Class<T> classOfT) throws JsonSyntaxException {
        Object object = gson.fromJson((String)json, (Type)classOfT);
        return Primitives.wrap(classOfT).cast(object);
    }
}
