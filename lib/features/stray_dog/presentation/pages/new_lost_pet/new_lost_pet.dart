import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/widgets/generic_text_form_field.dart';
import '../../../../../core/validators/new_pet_validators.dart';
import '../../../domain/entities/animal_type.dart';
import '../../../domain/entities/gender.dart';
import '../../../domain/usecases/create_lost_pet_report.dart';
import '../../bloc/stray_dog_bloc.dart';

class NewLostPet extends StatefulWidget {
  const NewLostPet({super.key});

  @override
  State<NewLostPet> createState() => _NewLostPetState();
}

class _NewLostPetState extends State<NewLostPet> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController distinctFeatureController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  int? selectedAnimalTypeValue;
  int? selectedGenderTypeValue;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    var animales = AnimalType.animalsDummyData;
    var generos = Gender.genderDummyData;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("new_lost_pet_title".tr()),
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GenericTextFormField(
                labelText: "new_lost_pet_name",
                textEditingController: nameController,
                validatorFunction: NewPetValidators.nameValidator,
                hintText: "new_lost_pet_name_hint",
              ),
              GenericTextFormField(
                labelText: "new_lost_pet_description",
                textEditingController: descriptionController,
                validatorFunction: NewPetValidators.nameValidator,
                hintText: "",
              ),
              GenericTextFormField(
                labelText: "new_lost_pet_distinct_feature",
                textEditingController: distinctFeatureController,
                validatorFunction: NewPetValidators.nameValidator,
                hintText: "new_lost_pet_distinct_feature_hint",
              ),
              GenericTextFormField(
                labelText: "new_lost_pet_phone_number",
                textEditingController: phoneController,
                validatorFunction: NewPetValidators.nameValidator,
                hintText: "new_lost_pet_phone_number_hint",
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<int>(
                  isExpanded: true,
                  hint: Text(
                    'Tipo de animal',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: animales
                      .map(
                        (AnimalType item) => DropdownMenuItem<int>(
                          value: item.id,
                          child: Text(
                            item.name,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedAnimalTypeValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAnimalTypeValue = value;
                      print(selectedAnimalTypeValue);
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData: const MenuItemStyleData(height: 40),
                ),
              ),
              const Divider(color: Colors.black38),
              DropdownButtonHideUnderline(
                child: DropdownButton2<int>(
                  isExpanded: true,
                  hint: Text(
                    'Genero del Animal',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: generos
                      .map(
                        (Gender item) => DropdownMenuItem<int>(
                          value: item.id,
                          child: Text(
                            item.name,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedGenderTypeValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedGenderTypeValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData: const MenuItemStyleData(height: 40),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                child: const Text("Tomar foto a mascota"),
                onPressed: () => showPhotoDialog(),
              ),
              const SizedBox(height: 20),
              selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      height: size.height * 0.2,
                      width: size.width * 0.2,
                    )
                  : Container(),
              const Spacer(),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                child: const Text("Continuar"),
                onPressed: () => createNewReport(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createNewReport() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<StrayDogBloc>(context).add(
        ReportNewLostPet(
          dto: NewLostPetReportDto(
            name: nameController.text,
            reportDate: "2025-01-21T18:20:14.5426681",
            description: descriptionController.text,
            imageUrl: "https://www.istockphoto.com/es/fotos/perro",
            distinctFeature: distinctFeatureController.text,
            phoneNumberInscribed: 945094126,
            isActive: true,
            animalTypeId: 2,
            genderId: 1,
          ),
        ),
      );
    }
  }

  Future<void> showPhotoDialog() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Elige de donde sacar la foto'),
              const SizedBox(height: 15),
              TextButton(
                child: const Text('Cámara'),
                onPressed: () => getLostPetImageFromCamera(),
              ),
              TextButton(
                child: const Text('Galería'),
                onPressed: () => getLostPetImageFromGallery(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getLostPetImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      if (context.mounted) Navigator.of(context).pop();
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  Future<void> getLostPetImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (context.mounted) Navigator.of(context).pop();
      selectedImage = File(image.path);
      setState(() {});
    }
  }
}
