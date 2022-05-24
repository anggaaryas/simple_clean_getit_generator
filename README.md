# Simple Clean GetIt Generator

Simple generate service locator using GetIt and clean architecture.

## Whats the different with other library?

this library simplify the implementation and can inject the service locator in order

## How to use

1. Install get_it (https://pub.dev/packages/get_it)
2. Install build_runner (https://pub.dev/packages/build_runner)
3. this library support adding Repository, DataSource, and Service.

for example:

``` dart
@AddRepositoryOf(services: [AuthRepository, UserInfoRepository], tag: "Remote")
class RemoteRepository implements AuthRepository, UserInfoRepository{
   
   // some implementation...

}
```

4. then run build_runner command:

```
     flutter pub run build_runner build
```

5. Then there will be a new file called ```service_locator.g.dart``` inside lib/


## Supported Annotation

### @AddRepositoryOf()

### @AddDataSourceOf()

### @AddServiceOf()
