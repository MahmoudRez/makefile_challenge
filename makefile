vpath %.c ./Src
vpath %.h ./Inc
vpath %.d ./dep

CC = gcc
LINK_TARGET = app.exe
INCLUDE_PATH = ./Inc


DEP_path = ./dep

SRC_PATH = ./Src

GEN_SRC = $(subst $(SRC_PATH)/,,$(wildcard $(SRC_PATH)/*.c))
#get the files .o for every file .c and merge the quiz file with them 
GEN_OBJ = $(patsubst %.c,%.o, $(GEN_SRC)) Rizk_MinaRaouf_Wael_Khaled.o
DEP_files = $(wildcard $(DEP_path)/*.d)

DEP_files_without_path = $(subst $(DEP_path)/,,$(wildcard $(DEP_path)/*.d))

-include $(DEP_files)

OBJ = main.o LCD.o DIO.o 	




CLEAN_TARGET = $(LINK_TARGET) $(OBJ) .\dep DEP_files_without_path




#cleaninig 
clean :
#	cd	.dep
	del $(CLEAN_TARGET)
#	del $(CLEAN_TARGET)
#linking 
$(LINK_TARGET): $(GEN_OBJ)  
# name of the specified object file should be explicitly added here
	$(CC) $(GEN_OBJ) -o $@
# and here also

%.o: %.c	
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
	$(CC) -MM -I$(INCLUDE_PATH) $< > $(DEP_path)/$*.d
# execution  
all:$(LINK_TARGET)