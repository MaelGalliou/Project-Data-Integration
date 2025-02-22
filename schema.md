```mermaid
classDiagram
    Object <|-- Director
    Object <|-- Actor
    Object <|-- Date
    Object <|-- Moovie
    Object <|-- tv_show

    class Director{
        String Name
    }
<<<<<<< HEAD

=======
>>>>>>> a374373bf82c1f352c4bcbc44935e3976c350bc3
    class Object{
        int id
        String genre
        String description
        String rating
        String Title
    }
    class Actor{
        String Name
    }
    class Date{
        Date added
        Date Release_year
    }
    class Moovie{
        String duration
    }
    class tv_show{
        String duration
    }
```