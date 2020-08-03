# responsive_grid

Responsive grid for Flutter

## Getting Started

Add ResponsiveGridItem inside a ResponsiveGrid

```Dart
ResponsiveGrid(
  spacing: 16,
  runSpacing: 16,
  children: [
    ResponsiveGridItem(
      lg: 12,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.blue,
        child: Center(child: Text("LG 12")),
      ),
    ),
    ResponsiveGridItem(
      xs: 6,
      sm: 3,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.orange,
        child: Center(child: Text("XS 6\nSM 3")),
      ),
    ),
    ResponsiveGridItem(
      xs: 6,
      sm: 3,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.green,
        child: Center(child: Text("XS 6\nSM 3")),
      ),
    ),
    ResponsiveGridItem(
      xs: 6,
      sm: 2,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.purple,
        child: Center(child: Text("XS 6\nSM 2")),
      ),
    ),
    ResponsiveGridItem(
      xs: 6,
      sm: 2,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.yellow,
        child: Center(child: Text("XS 6\nSM 2")),
      ),
    ),
    ResponsiveGridItem(
      xs: 6,
      sm: 2,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.grey,
        child: Center(child: Text("XS 6\nSM 2")),
      ),
    ),
    ResponsiveGridItem(
      xs: 6,
      sm: 2,
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.red,
        child: Center(child: Text("XS 6\nSM 2")),
      ),
    ),
  ],
)
```

## Parameters

ResponsiveGrid

| Parameter name | Type | Description | Required | Default value |
|---|---|---|---|---|
| children | List<ResponsiveGridItem> | Items to be shown | yes | - |
| colCount | int | Col count of the grid system | no | 12 |
| runSpacing | double | Space betwen each row | no | 0.0 |
| spacing | double | Space betwen each col | no | 0.0 |
| runSpacing | double | Space betwen each row | no | 0.0 |
| mainAxisAlignment | MainAxisAlignment | Main axis alignment | no | MainAxisAlignment.center |
| crossAxisAlignment | CrossAxisAlignment | Cross axis alignment | no | CrossAxisAlignment.stretch |

ResponsiveGridItem

| Parameter name | Type | Description | Required | Default value |
|---|---|---|---|---|
| xs | int | Col count to XS screens | no | - |
| sm | int | Col count to SM screens | no | - |
| md | int | Col count to MD screens | no | - |
| lg | int | Col count to LG screens | no | - |
| xl | int | Col count to XL screens | no | - |
| child | Widget | Widget to be shown | yes | - |

## Screen size
| Type | Max Width |
|---|---|
| xs | 576 |
| sm | 768 |
| md | 992 |
| lg | 1200 |
| xl | - |